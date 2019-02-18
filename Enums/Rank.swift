//
//  Rank.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import Foundation

// Rank: enum
// Type: Int
/* Generates the rank for the playing cards */
enum Rank: Int {
    case joker = 0
    case two = 2, three, four, five
    case six, seven, eight, nine, ten
    case jack, queen, king, ace
    
    static let allRanks = [
        Rank.two,
        Rank.three,
        Rank.four,
        Rank.five,
        Rank.six,
        Rank.seven,
        Rank.eight,
        Rank.nine,
        Rank.ten,
        Rank.jack,
        Rank.queen,
        Rank.king,
        Rank.ace,
        ]
    
    // Used to describe the name or value of the card
    func description() -> String {
        switch self {
        case .ace:
            return "Ace"
        case .jack:
            return "Jack"
        case .queen:
            return "Queen"
        case .king:
            return "King"
        default:
            return String(self.rawValue)
        }
    }
    
    // used to get the value associated with the number
    func value() -> Int {
        switch self {
        case .jack:
            return 11
        case .queen:
            return 12
        case .king:
            return 13
        case .ace:
            return 20
        default:
            return Int(self.rawValue)
        }
    }
}
