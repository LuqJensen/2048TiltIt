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
                row.append(createTile(tilesPerRow: matrix.count))
            }
            tiles.append(row)
        }
    }
        
    private func createTile(tilesPerRow: Int) -> TileView {
        let sizePerTileTotal = bounds.maxX / CGFloat(tilesPerRow)
        let padding = sizePerTileTotal / 10
        let sizePerTile = sizePerTileTotal - padding * 2
        
        let labelRect = CGRect(x: 0, y: 0, width: sizePerTile, height: sizePerTile)
        let tile = TileView(frame: labelRect)
        addSubview(tile)
        return tile
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        print("Bounds - x: \(bounds.maxX)")
        let sizePerTileTotal = bounds.maxX / CGFloat(tiles.count)
        let padding = sizePerTileTotal / 10
        let sizePerTile = sizePerTileTotal - padding * 2
        
        print("sizePerTileTotal: \(sizePerTileTotal)")
        print("padding: \(padding)")
        print("sizePerTile: \(sizePerTile)")
        
        for y in 0..<tiles.count {
            for x in 0..<tiles.count {
                print("Tile x: \(padding+CGFloat(x)*sizePerTile+padding*CGFloat(x)*2)")
                tiles[y][x].frame.origin = bounds.origin.offsetBy(dx: padding+CGFloat(x)*sizePerTile+padding*CGFloat(x)*2, dy: padding+CGFloat(y)*sizePerTile+padding*CGFloat(y)*2)
            }
        }
    }

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        
        roundedRect.addClip()
        UIColor.init(red: 51/255, green: 51/255, blue: 0, alpha: 1).setFill()
        roundedRect.fill()
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x + dx, y: y + dy)
    }
}
