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
    private var stateLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        setupUI()
        showDisclaimer() // Show disclaimer on app launch
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

    private func setupUI() {
        // State Label
        stateLabel = UILabel()
        stateLabel.translatesAutoresizingMaskIntoConstraints = false
        stateLabel.textAlignment = .center
        stateLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        stateLabel.textColor = .white
        stateLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(stateLabel)

        // State Selector Button
        let stateButton = UIButton(type: .system)
        stateButton.translatesAutoresizingMaskIntoConstraints = false
        stateButton.setTitle("Change State", for: .normal)
        stateButton.backgroundColor = UIColor.systemBlue
        stateButton.setTitleColor(.white, for: .normal)
        stateButton.layer.cornerRadius = 10
        stateButton.addTarget(self, action: #selector(promptForStateSelection), for: .touchUpInside)
        view.addSubview(stateButton)

        // Set up constraints for UI elements
        NSLayoutConstraint.activate([
            // State Label
            stateLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stateLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            stateLabel.heightAnchor.constraint(equalToConstant: 40),

            // State Button
            stateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stateButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            stateButton.heightAnchor.constraint(equalToConstant: 40)
        ])

        updateStateLabel()
    }

    private func showDisclaimer() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Disclaimer",
                message: "This application uses machine learning for classification, which may produce inaccurate results. Please double-check your item's category before disposal.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func updateStateLabel() {
        let selectedState = UserDefaults.standard.string(forKey: "SelectedState") ?? "Default"
        stateLabel.text = "Current State: \(selectedState.capitalized)"
    }

    @objc private func promptForStateSelection() {
        let alert = UIAlertController(title: "Select State", message: "Choose your location to adjust trash categorization.", preferredStyle: .actionSheet)

        let states = ["California", "New York", "Texas", "Pennsylvania", "Default"] // Add all supported states
        for state in states {
            alert.addAction(UIAlertAction(title: state, style: .default, handler: { _ in
                UserDefaults.standard.set(state.lowercased(), forKey: "SelectedState")
                self.updateStateLabel()
            }))
        }

        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
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

            let confidenceThreshold: Float = 0.2
            let selectedState = UserDefaults.standard.string(forKey: "SelectedState")?.capitalized ?? "Default"

            let classifications = results
                .filter { Float($0.confidence) >= confidenceThreshold }
                .map { observation -> (label: String, confidence: Float, category: String) in
                    let label = observation.identifier.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
                    let locationMapping = trashCategoryMappingByState[selectedState] ?? trashCategoryMappingByState["Default"]!

                    let category = locationMapping[label] ?? "Unknown"
                    if category == "Unknown" {
                        print("Unmapped label detected: \(label)")
                    }

                    return (label: observation.identifier, confidence: Float(observation.confidence), category: category)
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
