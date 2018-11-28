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
            UIColor.init(red: 128/255, green: 128/255, blue: 128/255, alpha: 1).setFill()
        case 2:
            UIColor.init(red: 192/255, green: 192/255, blue: 192/255, alpha: 1).setFill()
        case 4:
            UIColor.init(red: 0/255, green: 204/255, blue: 0/255, alpha: 1).setFill()
        case 8:
            UIColor.init(red: 255/255, green: 178/255, blue: 102/255, alpha: 1).setFill()
        case 16:
            UIColor.init(red: 255/255, green: 128/255, blue: 0/255, alpha: 1).setFill()
        case 32:
            UIColor.init(red: 255/255, green: 102/255, blue: 102/255, alpha: 1).setFill()
        case 64:
            UIColor.init(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).setFill()
        case 128...2048:
            UIColor.init(red: 204/255, green: 204/255, blue: 0/255, alpha: 1).setFill()
        default:
            UIColor.black.setFill()
        }
        
        roundedRect.fill()
    }

}
