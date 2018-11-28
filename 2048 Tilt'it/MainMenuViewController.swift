//
//  MainMenuViewController.swift
//  2048 Tilt'it
//
//  Created by Thanusaan Rasiah on 13/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {

    
    @IBAction func Continue(_ sender: UIButton) {
        if let cvc = lastSeguedToGameViewController {
            navigationController?.pushViewController(cvc, animated: true)
        } else {
            navigationController?.pushViewController(GameViewController(), animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "New Game" {
            if let cvc = segue.destination as? GameViewController {
                lastSeguedToGameViewController = cvc
            }
        }
    }
        
    
    var lastSeguedToGameViewController: GameViewController?
}
