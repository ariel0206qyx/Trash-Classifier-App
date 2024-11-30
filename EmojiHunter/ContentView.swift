import SwiftUI

struct ContentView: View {
    @State private var detectedObjects: [(label: String, confidence: Float, category: String)] = []
    @State private var displayedObjects: [(label: String, confidence: Float, category: String)] = []
    @State private var timer = Timer.publish(every: 0.2, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            CustomCameraRepresentable(detectedObjects: $detectedObjects)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                VStack {
                    ForEach(displayedObjects, id: \.label) { object in
                        VStack {
                            Text("Object: \(object.label.capitalized)")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Category: \(object.category)")
                                .font(.subheadline)
                                .foregroundColor(object.category.contains("Not a built-in object") ? .yellow : .green)
                            Text(String(format: "Confidence: %.2f%%", object.confidence * 100))
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.7))
                        }
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .cornerRadius(8)
                    }
                }
                .padding()
                .background(Color.black.opacity(0.5))
                .cornerRadius(15)
                .padding()
            }
        }
        .onReceive(timer) { _ in
            // Update displayedObjects every 0.5 seconds
            self.displayedObjects = Array(detectedObjects.prefix(5))
        }
    }
}
