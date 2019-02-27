//
//  Blackjack.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class Blackjack: GameTemplate {

    // MARK: Static Variable Declaration

    let deck: Deck!

    // MARK: Dynamic Variable Declaration

    // MARK: - Initialization

    // TODO: Make an override init for each game if needed
    init(aceHigh: Bool, standardDeck: Bool, deckNums: Int) {
        // Generate one standard 52 card deck with ace high
        self.deck = Deck(aceHigh, standardDeck, deckNums)

        // Put other template inits here
        // self.backgroundColor = UIColor.green
    }

    // Runs once when scene loads
    override func didMove(to view: SKView) {
        // background.position = CGPoint(x: frame.midX, y: frame.midY)
        // background.zPosition = zLevel.backdrop.rawValue
        // background.size.height = self.size.height
        // background.size.width = self.size.width
        // addChild(background)

        // Put other template scene items here
        stateMachine = GKStateMachine(states: [
            StartState(game: self),
            BetState(game: self),
            DrawState(game: self),
            HitState(game: self),
            DoubleDownState(game: self),
            SplitState(game: self),
            StandState(game: self),
            PayoutState(game: self),
            WinState(game: self),
            LoseState(game: self)
            ])

            stateMachine.enter(StartState.self)
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
        // Called before each frame
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

    // Move the stateMachine to the StartState
    func attemptToStart() {
        // Do all pre-state transition tasks here

        // Setup deck
        for item in deck.deckSize() {
            let card = deck.getTopCard()
            dealerCards.addCardToFront(card: card)
            let node: SKNode = dealerCards.getFirst()
            node.position = dealerCardsPos
            // Sets the card (node) size
            node.setScale(0.6)
        }

        // Attempt to transition to the state
        stateMachine.enter(StartState.self)
    }

    // Move the stateMachine to the BetState
    func attemptToBet() {
        // Do all pre-state transition tasks here

        // Attempt to transition to the state
        stateMachine.enter(BetState.self)
    }

    // Move the stateMachine to the DrawState
    func attemptToDraw() {
        // Do all pre-state transition tasks here

        // Attempt to transition to the state
        stateMachine.enter(DrawState.self)
    }

    // Move the stateMachine to the HitState
    func attemptToHit() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(HitState.self)
    }

    // Move the stateMachine to the DoubleDownState
    func attemptToDoubleDown() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(DoubleDownState.self)
    }

    // Move the stateMachine to the SplitState
    func attemptToSplit() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(SplitState.self)
    }

    // Move the stateMachine to the StandState
    func attemptToStand() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(StandState.self)
    }

    // Move the stateMachine to the PayoutState
    func attemptToWin() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(StandState.self)
    }

    // Move the stateMachine to the PayoutState
    func attemptToLose() {
      // Do all pre-state transition tasks here

      // Attempt to transition to the state
      stateMachine.enter(StandState.self)
    }

}
