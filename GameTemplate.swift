//
//  GameTemplate.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/8/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameTemplate: SKScene {

    // MARK: Static Variable Declaration

    let background = SKSpriteNode(imageNamed: "BackDrop")
    let deck: Deck!

    // MARK: Dynamic Variable Declaration

    var myCards = Hand()
    var dealerCards = Hand()
    var boardCards = Hand()

    /// Keeps track of the game states
    var stateMachine: GKStateMachine!
    /// Keeps track of the time for use in the update method.
    var previousUpdateTime: TimeInterval = 0

    // MARK: - Initialization

    // TODO: Make an override init for each game if needed
    init(aceHigh: Bool, standardDeck: Bool, deckNums: Int) {
        // Generate one standard 52 card deck with ace high
        self.deck = Deck(aceHigh, standardDeck, deckNums)

        // Put other template inits here
        // self.backgroundColor = UIColor.green
    }

    // MARK: Overrides

    // Runs once when scene loads
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: frame.midX, y: frame.midY)
        background.zPosition = zLevel.backdrop.rawValue
        background.size.height = self.size.height
        background.size.width = self.size.width
        addChild(background)
    }

    // Called to move cards
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)           // 1
            if let card = atPoint(location) as? Card {        // 2
                // Change this (moves card relative to touch position)
                card.position = location

                //card.position.x = card.position.x + (location.x - card.position.x)
                //card.position.y = location.y - (offset.y - card.position.y)
            }
        }
    }

    // Updates the SKScene each frame
    override func update(_ currentTime: TimeInterval) {
        // Calculate the time change since the previous update.
        let timeSincePreviousUpdate = currentTime - previousUpdateTime

        // The Empty state uses this to keep the indicator light flashing.
        stateMachine.update(deltaTime: timeSincePreviousUpdate)

        /*
            Set previousUpdateTime to the current time, so the next update has
            accurate information.
        */
        previousUpdateTime = currentTime
    }


    // Used to easily set the zPosition for different elements
    enum zLevel : CGFloat {
        // Scene Non-movable Objects
        case backdrop =   -5
        case sceneImage = -4
        case buttons =    -3
        case chips =      -2
        case other =      -1

        // Scene Movable Objects
        case card =       0
        case moving =     100
        case enlarged =   200
    }
}
