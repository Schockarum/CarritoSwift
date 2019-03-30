//
//  RegularButton.swift
//  Carrito de compras
//
//  Created by Luis Mauricio Esparza Vazquez on 3/27/19.
//  Copyright © 2019 Schock. All rights reserved.
//

import Foundation
import UIKit

class RegularButton: UIButton{
    
    var color: UIColor = .blue
    
    override func awakeFromNib() {
        backgroundColor = color.accentColdGray()
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 5
    }
    
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.05
        shake.repeatCount = 3
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: center.x - 10, y:center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x + 10, y: center.y)
        let toValue = NSValue(cgPoint: toPoint)
        
        shake.fromValue = fromValue
        shake.toValue = toValue
        
        layer.add(shake, forKey: nil)
    }
}
