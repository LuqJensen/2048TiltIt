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

    @IBAction func move(_ sender: UIButton) {
        let direction = sender.currentTitle
        switch direction {
        case "Left": game.moveLeft()
        case "Right": game.moveRight()
        case "Up": game.moveUp()
        case "Down": game.moveDown()
        default: game.moveLeft()
        }
    }
}

