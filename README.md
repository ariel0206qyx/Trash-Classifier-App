# Trash Classifier App

## Overview  
This application leverages machine learning to classify trash into actionable categories (e.g., recyclable, compostable, landfill) to assist users in proper waste management. The app uses real-time object detection via the iPhone camera, along with a CoreML-integrated model for classification.


## Features  
- Real-time object detection and classification using CoreML.  
- Displays top predictions along with confidence levels.  
- Maps recognized objects to waste categories like recyclable, compostable, and landfill.  
- Provides fallback suggestions for unrecognized objects.


## Open-Source Code Used  
1. **[MobileNetV2](https://github.com/keras-team/keras-applications)**:  
   - Pre-trained MobileNetV2 model was used for object detection.  
   - Integrated into the app to classify general objects, including trash items.  
2. **[TACO](https://github.com/pedropro/TACO)**:  
   - We explored and integrated the TACO dataset for training trash classification.
   - This dataset contains diverse annotations of trash in the wild, with labeled classes like bottles, cans, and plastic bags.

**Note on Dataset Usage**:
- Like discussed in class, training our own dataset often does not yield higher accuracy compared to leveraging pre-trained models on robust datasets.
- TACO dataset authors spent years collecting high-quality data, and replicating or exceeding their accuracy within our two-week timeframe was infeasible.
- As such, although we attempted to train our own data, we went back to using pre-trained models and focused on integrating functionality and refining user experience.


## Changes Made  
1. **Camera Integration**:  
   - Built a custom `UIViewController` to handle real-time camera input and process frames using CoreML models.  

2. **Trash Classification Mapping**:  
   - Developed a mapping dictionary to convert model outputs into actionable waste categories.  
   - Ensures that detected objects are categorized appropriately (e.g., "plastic bottle → recyclable").  

3. **Dynamic UI**:  
   - Designed a SwiftUI-based interface to display top predictions, confidence levels, and trash categories.  
   - Optimized UI updates to refresh predictions dynamically for better readability.

4. **Fallback Logic**:  
   - Added meaningful suggestions for objects that are not normally trash items, such as "Not a built-in object, but we think this object is...".

5. **Disclaimer on ML Usage**:  
   - Included a disclaimer in the app to notify users that a machine learning model generates the classification results and may not always be 100% accurate.
   - Encourages users to double-check classifications when uncertain.

6. **Regional Customization**:  
   - Adapted trash category mapping to reflect different state laws and waste management regulations within the U.S. (e.g., bottle deposit laws, composting rules).

7. **Confidence Levels Display**:  
   - The app prominently displays the confidence level for each classification, helping users assess the reliability of the prediction.
   - Lower confidence values are highlighted as less certain to encourage caution.
   

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


## Limitations  
- Requires active user participation (manual scanning of objects).  
- Accuracy depends on the generalization capability of the pre-trained MobileNetV2 model.  
- The app may struggle with objects not represented in the pre-trained model's dataset or in suboptimal conditions like poor lighting.


## Acknowledgments  
- **MobileNetV2** by Keras Team  
- Apple CoreML and Vision Frameworks for seamless iOS integration  
