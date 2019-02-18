//
//  Deck.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import Foundation
import SpriteKit

// Deck: class
// Type: N/A
/* Holds an array of Card used for different games */
class Deck {
    
    /* VARIABLES */
    private var deck = [Card]()
    private var discarded = [Card]()
    private var ranks = Rank.allRanks
    private var suits = Suit.allSuits
    private var aceHigh: Bool = true
    private var standardDeck: Bool = true
    private var deckNums: Int = 1
    
    // Runs when Deck class is called. Generates the first deck
    init(_ aceHigh: Bool = true,_ standardDeck: Bool = true,_ deckNums: Int = 1) {
        self.aceHigh = aceHigh
        self.standardDeck = standardDeck
        self.deckNums = deckNums
        
        if standardDeck {
            createDeck(aceHigh, deckNums)
        }
    }
    
    // Creates a deck from wanted cards
    func createDeck(_ high: Bool = true,_ nums: Int = 1) {
        
        // If the deck isn't empty, remove cards from deck
        if deck.count != 0 {
            deck.removeAll()
        }
        
        // Generate the deck from the ranks and suits given
        for _ in 0...nums {
            for rank in ranks {
                for suit in suits {
                    let tempCard = Card(rank, suit, false)       // false for faceDown
                    
                    // TODO: MAKE THIS SIZE SET SOMEWHERE ELSE
                    tempCard.scale(to: CGSize(width: 100, height: 200))
                    deck.append(tempCard)
                }
            }
        }
    }
    
    // Set the ranks that you want in your deck
    func setWantedRanks(_ rankArr: [Rank]) {
        self.ranks = rankArr
    }
    
    // Set the suits that you want in your deck
    func setWantedSuits(_ suitArr: [Suit]) {
        self.suits = suitArr
    }
    
    // Get top of the deck and move indexing "pointer" by 1
    func getTopCard() -> Card {
        return deck.first!
    }
    
    // Shuffle the deck [Card] array
    func shuffle() {
        deck.shuffle()
    }
    
    // Generate a brand new deck
    func new() {
        createDeck(self.aceHigh, self.deckNums)
        shuffle()
    }
    
    // Add card to discard pile and remove from deck
    func burn() {
        discarded.append(deck.first!)
        deck.remove(at: deck.startIndex)
    }
}
