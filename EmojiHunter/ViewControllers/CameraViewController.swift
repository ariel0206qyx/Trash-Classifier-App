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
    func didDetectObjects(_ objects: [(label: String, confidence: Float)])
}

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    weak var delegate: ObjectDetectionDelegate?
    private var captureSession: AVCaptureSession!
    private var previewLayer: AVCaptureVideoPreviewLayer!
    private let videoDataOutput = AVCaptureVideoDataOutput()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        setupVision()
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
                guard let results = request.results as? [VNClassificationObservation] else { return }
                let objects = results.map { (label: $0.identifier, confidence: $0.confidence) }
                self?.delegate?.didDetectObjects(objects)
            })
        } catch {
            fatalError("Failed to load Vision ML model: \(error)")
        }
    }()

    private func setupVision() {
        // Vision setup is handled by `classificationRequest`
    }

    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        try? handler.perform([classificationRequest])
    }
}
