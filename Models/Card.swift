//
//  Card.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import SpriteKit
import Foundation

// Card: class
// Type: SKSpriteNode
/* Used to hold the info for the proper ranks
   and suits of a deck of playing cards */
class Card : SKSpriteNode {
    
    // MARK: - VARIABLES
    
    private var suit: Suit!
    private var rank: Rank!
    private var value: Int = 0
    private var faceUp: Bool = false
    private var isMoveable: Bool = false
    //private var cardsSize: CGSize = GameSceneLayout.cardSize
    
    // MARK: - TEXTURES
    
    private var frontTexture: SKTexture!
    private var backTexture: SKTexture!
    
    // MARK: - Initialization
    
    init(_ rank: Rank ,_ suit: Suit ,_ faceUp: Bool) {
        self.suit = suit
        self.rank = rank
        self.value = rank.value()
        self.faceUp = faceUp
        
        // Make a texture and set the image equal to the string of the asset name
        let texture: SKTexture
        frontTexture = SKTexture(imageNamed: String(value) + suit.rawValue)
        backTexture = SKTexture(imageNamed: UserDefaults.standard.string(forKey: "cardBack") ?? "CardBackBlack")
        
        // Determine which side of the card you want to show
        if self.faceUp {
            texture = frontTexture
        } else {
            texture = backTexture
        }
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
    }
    
    // MARK: - Functions
    
    // Gets the value of card
    func getValue() -> Int {
        return value
    }
    
    // Sets the value of card
    func setValue(_ val: Int) {
        self.value = val
    }
    
    // Returns 1 if faceUp, 0 if faceDown
    func getFaceValue() -> Bool {
        return self.faceUp
    }
    
    // Change state of card movability
    func changeMoveability() {
        isMoveable = !isMoveable
    }
    
    // Move card to position on in scene
    func moveToPostion(_ pos: CGPoint) {
        let time = 0.6
        let moveCard = SKAction.move(to: pos, duration: time)
        self.run(moveCard)
    }
    
    // Update the zPosition
    func updateZPosition(_ zPos: Int) {
        self.zPosition = CGFloat(zPos)
    }
    
    //  Don't worry abut this (required for error checking SKSpriteNode)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    // MARK: - ANIMATIONS
    
    // Flips card over
    func flip() {
        let flipFirstHalf = SKAction.scaleX(to: 0, duration: 0.12)
        let flipLastHalf = SKAction.scaleX(to: 0.6, duration: 0.12)
        var changeTexture: SKAction
        
        if faceUp {
            changeTexture = SKAction.setTexture(backTexture)
        } else {
            changeTexture = SKAction.setTexture(frontTexture)
        }
        
        // Flips halfway, changes texture, then flips the last half
        let action = SKAction.sequence([flipFirstHalf, changeTexture, flipLastHalf])
        self.run(action)
        
        faceUp = !faceUp
    }
    
    // Enlarge and shrink the card similar to a pulse
    func pulse() {
        let cardLift = SKAction.scale(to: 0.8, duration: 0.15)
        //let cardFlash = SKAction.fadeAlpha(by: 0.2, duration: 1)
        //self.
        //let cardFlash = SKAction.
        let cardLower = SKAction.scale(to: 0.6, duration: 0.25)
        //let cardFlash = SKAction.fadeAlpha(by: 0.8, duration: 0.4)
        //self.run(cardFlash)
        let action = SKAction.sequence([cardLift,cardLower])
        self.run(action)
    }
}

