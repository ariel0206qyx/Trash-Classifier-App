# Trash Classifier App

## Overview  
This application leverages machine learning to classify trash into actionable categories (e.g., recyclable, compostable, landfill) to assist users in proper waste management. The app uses real-time object detection via the iPhone camera, along with a CoreML-integrated model for classification.

---

## Features  
- Real-time object detection and classification using CoreML.  
- Displays top predictions along with confidence levels.  
- Maps recognized objects to waste categories like recyclable, compostable, and landfill.  
- Provides fallback suggestions for unrecognized objects.

---

## Open-Source Code Used  
1. **[MobileNetV2](https://github.com/keras-team/keras-applications)**:  
   - Pre-trained MobileNetV2 model was used for object detection.  
   - Integrated into the app to classify general objects, including trash items.  

---

## Changes Made  
### To Open-Source Code:  
- **Custom Mapping**: Implemented a trash classification mapping layer that links detected objects (e.g., "bottle") to appropriate waste categories (e.g., "recyclable").  
- **Fallback Logic**: Added meaningful suggestions for unrecognized objects, such as "Not a built-in object, but we think this object is...".  
---

## New Code Implemented  
1. **Camera Integration**:  
   - Built a custom `UIViewController` to handle real-time camera input and process frames using CoreML models.  

2. **Trash Classification Mapping**:  
   - Developed a mapping dictionary to convert model outputs into actionable waste categories.  
   - Ensures that detected objects are categorized appropriately (e.g., "plastic bottle → recyclable").  

3. **Dynamic UI**:  
   - Designed a SwiftUI-based interface to display top predictions, confidence levels, and trash categories.  
   - Optimized UI updates to refresh predictions dynamically for better readability.

---

## Running the Application  
1. Clone the repository:  
   ```bash
   git clone https://github.com/ariel0206qyx/haii-ML-project.git
   cd haii-ML-project
   ```

2. Open the project in Xcode:  
   - Ensure you have Xcode installed.  
   - Open the `TrashClassifier.xcodeproj` file.

3. Build and run the app on a physical iOS device (camera functionality does not work on simulators).  

---

## Limitations  
- Requires active user participation (manual scanning of objects).  
- Accuracy depends on the generalization capability of the pre-trained MobileNetV2 model.  
- The app may struggle with objects not represented in the pre-trained model's dataset or in suboptimal conditions like poor lighting.

---

## Acknowledgments  
- **MobileNetV2** by Keras Team  
- Apple CoreML and Vision Frameworks for seamless iOS integration  
