//
//  TileView.swift
//  2048 Tilt'it
//
//  Created by Thanusaan Rasiah on 25/11/2018.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit

class TileView: UIView {
    
    var value: Int = 0 {
        didSet {
            if value == 0 {
                label.text = ""
            } else {
                label.text = String(value)
            }
            setNeedsDisplay()
            setNeedsLayout()
        }
    }
    
    var label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel(frame: frame)
        label.text = ""
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        super.init(frame: frame)
    
        addSubview(label)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        let labelRect = CGRect(x: 0, y: 0, width: 60, height: 60)
        label = UILabel(frame: labelRect)
        label.text = ""
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        super.init(coder: aDecoder)
        addSubview(label)
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 8.0)
        roundedRect.addClip()
        switch value {
        case 0:
            UIColor.darkGray.setFill()
        case 2:
            UIColor.lightGray.setFill()
        case 4:
            UIColor.cyan.setFill()
        case 8:
            UIColor.green.setFill()
        case 16:
            UIColor.magenta.setFill()
        case 32:
            UIColor.orange.setFill()
        case 64:
            UIColor.red.setFill()
        case 128...2048:
            UIColor.yellow.setFill()
        default:
            UIColor.black.setFill()
        }
        
        roundedRect.fill()
    }

}
