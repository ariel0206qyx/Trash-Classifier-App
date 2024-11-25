import SwiftUI

struct ContentView: View {
    @State private var detectedObjects: [(label: String, confidence: Float)] = []
    @State private var displayedObjects: [(label: String, confidence: Float)] = []
    @State private var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect() // Timer for 5-second intervals

    var body: some View {
        ZStack {
            // Camera Feed
            CustomCameraRepresentable(detectedObjects: $detectedObjects)
                .edgesIgnoringSafeArea(.all)

            // Top 5 Objects Overlay
            VStack {
                Spacer()
                VStack(spacing: 10) {
                    Text("Top 5 Objects")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)

                    ForEach(displayedObjects, id: \.label) { object in
                        HStack {
                            Text(object.label.capitalized)
                                .font(.headline)
                                .foregroundColor(.white)
                            Spacer()
                            Text(String(format: "%.2f%%", object.confidence * 100))
                                .font(.headline)
                                .foregroundColor(.white.opacity(0.8))
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
            updateDisplayedObjects()
        }
    }

    // Helper Function to Extract Top 5 Detected Objects
    private func updateDisplayedObjects() {
        displayedObjects = detectedObjects
            .sorted { $0.confidence > $1.confidence }
            .prefix(5)
            .map { $0 }
    }
}
