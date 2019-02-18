//
//  Hand.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

// Hand: class
// Type: N/A
/* Holds an array of Card and simulates some
   of the functinality of a hand of cards  */
class Hand {
    
    /* VARIABLES */
    private var hand = [Card]()
    
    // Add card to end of hand
    func addCard(card: Card) {
        hand.append(card)
    }
    
    // Add card to front of hand
    func addCardToFront(card: Card) {
        hand.insert(card, at: hand.startIndex)
    }
    
    // Remove first card in hand
    func removeFirst() {
        //print(hand[0].description," ", hand[0].getValue())
        hand.remove(at: hand.startIndex)
    }
    
    // Remove last card from hand
    func removeLast() {
        //print(hand[hand.count-1].description," ", hand[hand.count-1].getValue())
        hand.remove(at: hand.endIndex)
    }
    
    // Remove and return the first card in hand
    func removeAndReturnFirst() -> Card {
        let temp = getFirst()
        removeFirst()
        return temp
    }
    
    // Remove and return the last card in hand
    func removeAndReturnLast() -> Card {
        let temp = getLast()
        removeLast()
        return temp
    }
    
    // Return the first element in the array
    func getFirst() -> Card {
        return hand.first!
    }
    
    // Return the last element in the array
    func getLast() -> Card {
        return hand.last!
    }
    
    // Move the front card to the back
    func frontToBack() {
        let temp = getFirst()
        removeFirst()
        addCard(card: temp)
    }
    
    // Empty the array
    func reset() {
        hand.removeAll()
    }
    
    // Return the length of the array
    func length() -> Int {
        return hand.count
    }
}

