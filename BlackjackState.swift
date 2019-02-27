//
//  BlackjackState.swift
//  TheCardsApp
//
//  Created by Austin Winarski on 1/12/19.
//  Copyright © 2019 Austin Winarski. All rights reserved.
//

// REVIEW AND MODIFY THIS FILE FOR TheCardsApp

import SpriteKit
import GameplayKit

class BlackjackState: GKState {

    let game: GameTemplate

    /// The name of the node in the game scene that is associated with this state.
    let associatedNodeName: String

    /// Convenience property to get the state's associated sprite node.
    var associatedNode: SKSpriteNode? {
        return game.childNode(withName: "//\(associatedNodeName)") as? SKSpriteNode
    }


    // MARK: Initialization

    init(game: GameTemplate, associatedNodeName: String) {
        self.game = game
        self.associatedNodeName = associatedNodeName
    }

    // MARK: GKState overrides

    /// Highlights the sprite representing the state.
    override func didEnter(from previousState: GKState?) {
        guard let associatedNode = associatedNode else { return }
        associatedNode.color = SKColor.lightGray
    }

    /// Unhighlights the sprite representing the state.
    override func willExit(to nextState: GKState) {
        guard let associatedNode = associatedNode else { return }
        associatedNode.color = SKColor.darkGray
    }

    // MARK: Methods

    /// Changes the dispenser's indicator light to the specified color.
    func changeIndicatorLightToColor(_ color: SKColor) {
        let indicator = game.childNode(withName: "//indicator") as! SKSpriteNode
        indicator.color = color
    }

}
