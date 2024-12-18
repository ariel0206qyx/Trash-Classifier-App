//
//  TrashMapping.swift
//  EmojiHunter
//
//  Created by ariel on 11/29/24.
//

import Foundation

// Define state-specific trash category mappings
let trashCategoryMappingByState: [String: [String: String]] = [
    "California": [
            // Extensive recycling infrastructure
            "water bottle": "Recyclable",
            "cardboard": "Recyclable",
            "plastic container": "Recyclable",
            "pizza box": "Recyclable",
            "milk carton": "Recyclable",
            "plastic cup": "Recyclable",
            "aluminum foil": "Recyclable",
            "egg carton (cardboard)": "Recyclable",
            "wrapping paper (non-metallic)": "Recyclable",
            "envelope": "Recyclable",
            "glass jar": "Recyclable",
            "bubble wrap": "Recyclable",
            "corrugated cardboard": "Recyclable",
            "paper grocery bag": "Recyclable",
            "paper bag": "Recyclable",
            "kraft paper": "Recyclable",
            "newspaper": "Recyclable",
            "newspaper insert": "Recyclable",
            "white office paper": "Recyclable",
            "white office mail": "Recyclable",
            "magazine": "Recyclable",
            "catalog": "Recyclable",
            "folding carton": "Recyclable",
            "paperboard packaging": "Recyclable",
            "aseptic container": "Recyclable",
            "gable-top cartons": "Recyclable",
            "paper food service ware": "Recyclable",
            "tin can": "Recyclable",
            "aluminum can CRV": "Recyclable",
            "aluminum can": "Recyclable",
            "plastic beverage bottle (PETE, HDPE)": "Recyclable",
            "glass bottle": "Recyclable",
            "clear glass container": "Recyclable",
            "plastic trash bag": "Recyclable",
            "plastic food service ware": "Recyclable",
            "clean dimensional lumber": "Recyclable",
            "clean engineered wood": "Recyclable",
            "clean pallets and crate": "Recyclable",

            
            // Compostable Objects
            "banana": "Compostable",
            "apple": "Compostable",
            "orange peel": "Compostable",
            "coffee": "Compostable",
            "tea bag": "Compostable",
            "bread": "Compostable",
            "grass clippings": "Compostable",
            "flower": "Compostable",
            "egg shell": "Compostable",
            "egg": "Compostable",
            "meat": "Compostable",
            "fish": "Compostable",
            "chicken": "Compostable",
            "turkey": "Compostable",
            "pork": "Compostable",
            "beef": "Compostable",
            "milk": "Compostable",
            "dairy": "Compostable",
            "cheese": "Compostable",
            "leaf": "Compostable",
            "grass": "Compostable",
            "prunings": "Compostable",
            "branch": "Compostable",
            "wood": "Compostable",


            // Waste Items (Strict policies about limiting contamination)
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "chip bag": "Waste",
            "candy wrapper": "Waste",
            "tissue": "Waste",
            "broken glass": "Waste",
            "diaper": "Waste",
            "mask (disposable)": "Waste",
            "foam packaging": "Waste",
            "personal protective equipments": "Waste",
            "mixed residues": "Waste",
            "tire": "Waste",
            "mattress": "Recyclable",
            "mattress foundation": "Recyclable",


            // Electronics
            "phone": "E-Waste",
            "laptop": "E-Waste",
            "tablet": "E-Waste",
            "keyboard": "E-Waste",
            "monitor": "E-Waste",
            "mouse": "E-Waste",
            "charger": "E-Waste",
            "earphones": "E-Waste",
            "remote control": "E-Waste",
            "batteries": "E-Waste",
            "cable": "E-Waste",
            "hard drive": "E-Waste",
            "computer keyboard": "E-Waste",
            "desktop computer": "E-Waste",
            "battrey": "E-Waste",
            "solar panel": "E-Waste"
        ],
    "New York": [
            // (Focus on glass, metal, and paper)
            "water bottle": "Recyclable",
            "glass bottle": "Recyclable",
            "cardboard": "Recyclable",
            "aluminum can": "Recyclable",
            "tin can": "Recyclable",
            "plastic container": "Recyclable",
            "milk carton": "Recyclable",
            "newspaper": "Recyclable",
            "magazine": "Recyclable",
            "wrapping paper (non-metallic)": "Recyclable",
            "pizza box": "Waste", // Pizza boxes are waste because of grease
            "glass bottle (colored)": "Recyclable",
            "metal lid": "Recyclable",
            "hard plastic": "Recyclable",
            "rigid plastic": "Recyclable",
            "foil product": "Recyclable",
            "large plastic container": "Recyclable",

            // Compostable Items
            "apple": "Compostable",
            "orange peel": "Compostable",
            "coffee": "Compostable",
            "bread": "Compostable",
            "egg shell": "Compostable",
            "vegetable peels": "Compostable",
            "fruit peel": "Compostable",
            "coffee ground": "Compostable",
            "tea bag": "Compostable",
            "grass clipping": "Compostable",
            "leaf": "Compostable",
            "yard trimming": "Compostable",
            "paper towel": "Compostable",
            "napkin": "Compostable",
            "paper plate": "Compostable",

            // Waste Items (Limited acceptance for soft plastics)
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "chip bag": "Waste",
            "candy wrapper": "Waste",
            "diaper": "Waste",
            "light bulb (non-LED)": "Waste",
            "ceramic": "Waste",
            "broken mirror": "Waste",
            "mirror": "Waste",
            "shredded paper": "Waste",
            "foam container": "Waste",
            "non-recyclable plastic": "Waste",
            "rubber product": "Waste",
            "vacuum bag": "Waste",
            "sanitary product": "Waste",

            // Electronics
            "phone": "E-Waste",
            "laptop": "E-Waste",
            "tablet": "E-Waste",
            "keyboard": "E-Waste",
            "monitor": "E-Waste",
            "mouse": "E-Waste",
            "charger": "E-Waste",
            "earphones": "E-Waste",
            "remote control": "E-Waste",
            "batteries": "E-Waste",
            "cable": "E-Waste",
            "hard drive": "E-Waste",
            "computer keyboard": "E-Waste",
            "desktop computer": "E-Waste",
            "television": "E-Waste",
            "computer": "E-Waste",
            "game console": "E-Waste",

            // Special Waste Items
            "paint": "Special Waste",
            "oil": "Special Waste",
            "fluorescent bulb": "Special Waste",
            "propane tank": "Special Waste",
            "car battery": "Special Waste",
            "pesticide": "Special Waste",
            "hazardous chemical": "Special Waste",
            "mattress": "Special Waste",
            "tire": "Special Waste",
            "large appliance": "Special Waste",
            "construction debris": "Special Waste",
            "wood scrap": "Special Waste"
        ],
    "Texas": [
            // Focus on metal, glass, and cardboard
            "water bottle": "Recyclable",
            "glass bottle": "Recyclable",
            "cardboard": "Recyclable",
            "aluminum can": "Recyclable",
            "plastic container": "Recyclable",
            "aluminum foil": "Recyclable",
            "egg carton (cardboard)": "Recyclable",
            
            // Composting is available but not widespread
            "banana": "Compostable",
            "apple": "Compostable",
            "coffee": "Compostable",
            "corn husk": "Compostable",
            "vegetable peel": "Compostable",

            // Soft plastics and greasy items are waste
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "pizza box": "Waste",
            "chip bag": "Waste",
            "tissue": "Waste",

            // Electronics
            "phone": "E-Waste",
            "laptop": "E-Waste",
            "tablet": "E-Waste",
            "keyboard": "E-Waste",
            "monitor": "E-Waste",
            "mouse": "E-Waste",
            "charger": "E-Waste",
            "earphones": "E-Waste",
            "remote control": "E-Waste",
            "batteries": "E-Waste",
            "cable": "E-Waste",
            "hard drive": "E-Waste",
            "computer keyboard": "E-Waste",
            "desktop computer": "E-Waste"
        ],
    "Pennsylvania": [
            // Focus on metals, glass, and clean paper products
            "water bottle": "Recyclable",
            "glass bottle": "Recyclable",
            "aluminum can": "Recyclable",
            "cardboard": "Recyclable",
            "milk carton": "Recyclable",
            "plastic container": "Recyclable",
            "pizza box": "Recyclable",
            "glass jar": "Recyclable",
            "metal food can": "Recyclable",
            "plastic jug": "Recyclable",
            "aluminum foil": "Recyclable",
            "newspaper": "Recyclable",
            "office paper": "Recyclable",
            "magazine": "Recyclable",
            "corrugated cardboard boxe": "Recyclable",
            "clean paperboard": "Recyclable",

            // Compostable Objects
            "banana": "Compostable",
            "coffee": "Compostable",
            "vegetable": "Compostable",
            "grass clippings": "Compostable",
            "apple core": "Compostable",
            "yard waste": "Compostable",
            "fruit peel": "Compostable",
            "bread crust": "Compostable",
            "eggshell": "Compostable",
            "compostable napkin": "Compostable",
            "flower": "Compostable",
            "coffee filter": "Compostable",
            "tea bag": "Compostable",

            // Waste Items (Soft plastics are waste)
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "cigarette butt": "Waste",
            "diaper": "Waste",
            "foam packaging": "Waste",
            "plastic wrapper": "Waste",
            "broken ceramic": "Waste",
            "disposable utensil": "Waste",
            "mixed-material packaging": "Waste",
            "vacuum dust": "Waste",
            "rubber material": "Waste",
            "food-soiled paper": "Waste",
            "non-recyclable plastic": "Waste",

            // Electronics
            "phone": "E-Waste",
            "laptop": "E-Waste",
            "tablet": "E-Waste",
            "keyboard": "E-Waste",
            "monitor": "E-Waste",
            "mouse": "E-Waste",
            "charger": "E-Waste",
            "earphones": "E-Waste",
            "remote control": "E-Waste",
            "batteries": "E-Waste",
            "cable": "E-Waste",
            "hard drive": "E-Waste",
            "computer keyboard": "E-Waste",
            "desktop computer": "E-Waste",
            "televisions": "E-Waste",
            "printer": "E-Waste",
            "game console": "E-Waste",
            "headphone": "E-Waste",
            "electronic watche": "E-Waste",
            "power tool": "E-Waste",
            "electric cable": "E-Waste",

            // Special Waste Items
            "motor oil container": "Special Waste",
            "oil filter": "Special Waste",
            "paint can": "Special Waste",
            "lead-acid battery": "Special Waste",
            "fluorescent tube": "Special Waste",
            "propane tank": "Special Waste",
            "automotive part": "Special Waste",
            "asbestos material": "Special Waste",
            "construction debris": "Special Waste",
            "treated wood": "Special Waste"
        ],
    "Default": [
            // Recyclable Items
            "water bottle": "Recyclable",
            "glass bottle": "Recyclable",
            "cardboard": "Recyclable",
            "aluminum can": "Recyclable",
            "tin can": "Recyclable",
            "milk carton": "Recyclable",
            "newspaper": "Recyclable",
            "magazine": "Recyclable",
            "paper": "Recyclable",
            "plastic container": "Recyclable",
            "soda can": "Recyclable",
            "aluminum foil": "Recyclable",
            "pizza box": "Recyclable",
            "plastic cup": "Recyclable",
            "plastic bottle cap": "Recyclable",
            "egg carton (cardboard)": "Recyclable",
            "glass jar": "Recyclable",
            "bubble wrap": "Recyclable",
            "wrapping paper (non-metallic)": "Recyclable",
            "envelope": "Recyclable",

            // Compostable Items
            "banana": "Compostable",
            "apple": "Compostable",
            "orange": "Compostable",
            "coffee": "Compostable",
            "tea bag": "Compostable",
            "food scraps": "Compostable",
            "leaf": "Compostable",
            "grass clippings": "Compostable",
            "egg": "Compostable",
            "corn": "Compostable",
            "vegetable": "Compostable",
            "bread": "Compostable",
            "avocado": "Compostable",
            "nut": "Compostable",
            "flower": "Compostable",
            "compostable plate": "Compostable",
            "compostable cup": "Compostable",
            "compostable utensils": "Compostable",

            // Waste Items
            "plastic straw": "Waste",
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "chip bag": "Waste",
            "tissue": "Waste",
            "candy wrapper": "Waste",
            "broken glass": "Waste",
            "diaper": "Waste",
            "toothpaste tube": "Waste",
            "rubber band": "Waste",
            "cigarette butt": "Waste",
            "pen": "Waste",
            "crayon": "Waste",
            "toothbrush": "Waste",
            "balloon": "Waste",
            "light bulb (non-LED)": "Waste",
            "nail polish bottle": "Waste",
            "disposable razor": "Waste",
            "foam packaging": "Waste",
            "mask (disposable)": "Waste",

            // Electronics
            "phone": "E-Waste",
            "laptop": "E-Waste",
            "tablet": "E-Waste",
            "keyboard": "E-Waste",
            "monitor": "E-Waste",
            "mouse": "E-Waste",
            "charger": "E-Waste",
            "earphones": "E-Waste",
            "remote control": "E-Waste",
            "batteries": "E-Waste",
            "cable": "E-Waste",
            "hard drive": "E-Waste",
            "computer keyboard": "E-Waste",
            "desktop computer": "E-Waste"
    ]
]

// Function to retrieve the trash category mapping for a specific state
func getTrashCategory(for item: String, state: String) -> String {
    let stateMapping = trashCategoryMappingByState[state] ?? trashCategoryMappingByState["Default"]!
    return stateMapping[item.lowercased()] ?? "Unknown"
}
