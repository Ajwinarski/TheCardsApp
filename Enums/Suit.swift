//
//  Suit.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import Foundation

// Suit: enum
// Type: String
/* Generates the suit for the playing cards */
enum Suit: String {
    case clubs, diamonds, hearts, spades  
    
    static let allSuits = [
        Suit.clubs,
        Suit.diamonds,
        Suit.hearts,
        Suit.spades
    ]
    
    // Used to describe the suit of the card
    func description() -> String {
        switch self {
        case .clubs:
            return "C"
        case .diamonds:
            return "D"
        case .hearts:
            return "H"
        case .spades:
            return "S"
        }
    }
}
