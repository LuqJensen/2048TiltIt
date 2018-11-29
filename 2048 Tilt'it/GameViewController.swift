//
//  ViewController.swift
//  2048 Tilt'it
//
//  Created by Lucas on 01/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import CoreMotion
import CoreData

class GameViewController: UIViewController {
    
    var motionManager = CMMotionManager()
    
    var game = Game()
    
    override func viewDidLoad() {
        UIApplication.shared.isIdleTimerDisabled = true
        gameView.generateTiles(game.matrix)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        motionManager.deviceMotionUpdateInterval = 0.2
        
        var lastMotion = ""
        motionManager.startDeviceMotionUpdates(to: OperationQueue.current!) { (data, error) in
            if let myData = data {
                 if myData.attitude.pitch <= 0.4 {
                    if lastMotion != "up" {
                        self.game.moveUp()
                    }
                    lastMotion = "up"
                }
                else if myData.attitude.pitch > 1.4 {
                    if lastMotion != "down" {
                        self.game.moveDown()
                    }
                    lastMotion = "down"
                }
                else if myData.attitude.roll <= -1 {
                    if lastMotion != "left" {
                        self.game.moveLeft()
                    }
                    lastMotion = "left"
                }
                else if myData.attitude.roll > 1 {
                    if lastMotion != "right" {
                        self.game.moveRight()
                    }
                    lastMotion = "right"
                }
                 else {
                    lastMotion = ""
                }
                self.gameView.setTiles(newValues: self.game.matrix)
                self.scoreLabel.text = "Score: \(self.game.score)"
            }
        }
    }

    @IBOutlet weak var gameView: GameView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Score", in: context)
        let newScore = NSManagedObject(entity: entity!, insertInto: context)
        
        newScore.setValue(Date(), forKey: "date")
        newScore.setValue(game.score, forKey: "score")
        
        do {
            try context.save()
        } catch {
            print("Something went wrong saving")
        }
    }
}

