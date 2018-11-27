//
//  ViewController.swift
//  2048 Tilt'it
//
//  Created by Lucas on 01/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var game = Game()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

    @IBOutlet weak var gameView: GameView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func move(_ sender: UIButton) {
        let direction = sender.currentTitle
        switch direction {
        case "Left":
            game.moveLeft()
        case "Right":
            game.moveRight()
        case "Up":
            game.moveUp()
        case "Down":
            game.moveDown()
        case "Start":
            gameView.generateTiles(game.matrix)
            gameView.setNeedsDisplay()
            gameView.setNeedsLayout()
        default: game.moveLeft()
        }
        gameView.setTiles(newValues: game.matrix)
        
        scoreLabel.text = "Score: \(game.score)"
    }
}

