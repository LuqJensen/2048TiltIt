//
//  GameView.swift
//  2048 Tilt'it
//
//  Created by Thanusaan Rasiah on 25/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class GameView: UIView {
    
    var tiles: [[TileView]] = [] {
        didSet {
            setNeedsDisplay()
            setNeedsLayout()
        }
        
    }
    
    func setTiles(newValues: [[Int]]) {
        for y in 0..<newValues.count {
            for x in 0..<newValues.count {
                    tiles[y][x].value = newValues[y][x]
            }
        }
    }
    
    func generateTiles(_ matrix: [[Int]]) {
        for _ in 0..<matrix.count {
            var row: [TileView] = []
            for _ in 0..<matrix.count {
                row.append(createTile())
            }
            tiles.append(row)
        }
    }
        
    private func createTile() -> TileView {
        let labelRect = CGRect(x: 0, y: 0, width: 75, height: 75)
        let tile = TileView(frame: labelRect)
        addSubview(tile)
        return tile
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for y in 0..<tiles.count {
            for x in 0..<tiles.count {
                tiles[y][x].frame.origin = bounds.origin.offsetBy(dx: CGFloat(x*75+x*25), dy: CGFloat(y*75+y*25))
            }
        }
    }

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        
        roundedRect.addClip()
        UIColor.brown.setFill()
        roundedRect.fill()
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
