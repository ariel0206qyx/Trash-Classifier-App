//
//  CameraViewController.swift
//  EmojiHunter
//
//  Created by ariel on 11/25/24.
//

import UIKit
import AVFoundation
import Vision
import CoreML

protocol ObjectDetectionDelegate: AnyObject {
    func didDetectObjects(_ objects: [(label: String, confidence: Float, category: String)])
}

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    weak var delegate: ObjectDetectionDelegate?
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private let videoDataOutput = AVCaptureVideoDataOutput()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
    }

    private func setupCamera() {
        captureSession = AVCaptureSession()

        guard let videoDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput = try! AVCaptureDeviceInput(device: videoDevice)
        captureSession.addInput(videoInput)

        videoDataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(videoDataOutput)

        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)

        captureSession.startRunning()
    }

    lazy var classificationRequest: VNCoreMLRequest = {
        do {
            let model = try VNCoreMLModel(for: MobileNetV2().model)
            return VNCoreMLRequest(model: model, completionHandler: { [weak self] request, _ in
                self?.processClassifications(for: request)
            })
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()
    
    private func processClassifications(for request: VNRequest) {
        DispatchQueue.main.async {
            guard let results = request.results as? [VNClassificationObservation] else {
                print("No classification results found.")
                return
            }

            // Set a confidence threshold
            let confidenceThreshold: Float = 0.2

            let classifications = results
                .filter { Float($0.confidence) >= confidenceThreshold } // Filter low-confidence results
                .map { observation -> (label: String, confidence: Float, category: String) in
                    let label = observation.identifier.lowercased() // Normalize to lowercase
                    let confidence = Float(observation.confidence)
                    
                    // Perform looser matching
                    let category = trashCategoryMapping.first { (key, _) in
                        label.contains(key) // Check if the label contains the key as a substring
                    }?.value ?? "Not a built-in object, but we think this object is \(observation.identifier)"

                    return (label: observation.identifier, confidence: confidence, category: category)
                }

            self.delegate?.didDetectObjects(classifications)
        }
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        try? handler.perform([classificationRequest])
    }
}
