//
//  Emoji.swift
//  EmojiHunter
//
//  Created by ariel on 11/24/24.
//

protocol EmojiFoundDelegate {
  func emojiWasFound(result: Bool)
}


enum EmojiSearch {
  case found
  case notFound
  case searching
  case gameOver
}


struct EmojiModel {
  var emoji: String
  var emojiName: String
}


let emojiObjects = [
                    // Tech-related and study items
                    EmojiModel(emoji: "💻", emojiName: "laptop"),
                    EmojiModel(emoji: "📕", emojiName: "book"),
                    EmojiModel(emoji: "✏️", emojiName: "pencil"),
                    EmojiModel(emoji: "📱", emojiName: "phone"),
                    EmojiModel(emoji: "🖊", emojiName: "pen"),
                    
                    // Common trash items
                    EmojiModel(emoji: "🍎", emojiName: "apple core"),
                    EmojiModel(emoji: "🥤", emojiName: "cup"),
                    EmojiModel(emoji: "🗑", emojiName: "trash can"),
                    EmojiModel(emoji: "📄", emojiName: "paper"),
                    EmojiModel(emoji: "🧻", emojiName: "toilet paper roll"),
                    EmojiModel(emoji: "🍌", emojiName: "banana peel")]

