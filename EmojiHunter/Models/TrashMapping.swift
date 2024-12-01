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
            "glass bottle": "Recyclable",
            "cardboard": "Recyclable",
            "aluminum can": "Recyclable",
            "tin can": "Recyclable",
            "plastic container": "Recyclable",
            "pizza box": "Recyclable",
            "milk carton": "Recyclable",
            "newspaper": "Recyclable",
            "magazine": "Recyclable",
            "plastic cup": "Recyclable",
            "aluminum foil": "Recyclable",
            "egg carton (cardboard)": "Recyclable",
            "wrapping paper (non-metallic)": "Recyclable",
            "envelope": "Recyclable",
            "glass jar": "Recyclable",
            "bubble wrap": "Recyclable",
            
            // Compostable Objects
            "banana": "Compostable",
            "apple": "Compostable",
            "orange peel": "Compostable",
            "coffee": "Compostable",
            "tea bag": "Compostable",
            "bread": "Compostable",
            "leaf": "Compostable",
            "grass clippings": "Compostable",
            "flower": "Compostable",

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

            // Compostable Items
            "apple": "Compostable",
            "orange peel": "Compostable",
            "coffee": "Compostable",
            "bread": "Compostable",
            "egg shell": "Compostable",

            // Waste Items (Limited acceptance for soft plastics)
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "chip bag": "Waste",
            "candy wrapper": "Waste",
            "diaper": "Waste",
            "light bulb (non-LED)": "Waste",

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

            // Compostable Objects
            "banana": "Compostable",
            "coffee": "Compostable",
            "vegetable": "Compostable",
            "grass clippings": "Compostable",
            "apple core": "Compostable",

            // Waste Items (Soft plastics are waste)
            "plastic bag": "Waste",
            "styrofoam": "Waste",
            "cigarette butt": "Waste",
            "diaper": "Waste",
            "foam packaging": "Waste",

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
