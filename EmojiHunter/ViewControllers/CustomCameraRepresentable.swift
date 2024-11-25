//
//  CustomCameraRepresentable.swift
//  EmojiHunter
//
//  Created by ariel on 11/25/24.
//

import Foundation
import SwiftUI

struct CustomCameraRepresentable: UIViewControllerRepresentable {
    @Binding var detectedObjects: [(label: String, confidence: Float)]

    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.delegate = context.coordinator
        return controller
    }

    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, ObjectDetectionDelegate {
        var parent: CustomCameraRepresentable

        init(_ parent: CustomCameraRepresentable) {
            self.parent = parent
        }

        func didDetectObjects(_ objects: [(label: String, confidence: Float)]) {
            DispatchQueue.main.async {
                self.parent.detectedObjects = objects
            }
        }
    }
}
