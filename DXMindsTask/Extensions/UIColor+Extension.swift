//
//  UIColor+Extension.swift
//  DXMindsTask
//
//  Created by apple on 18/05/21.
//

import UIKit

//MARK:- Generating a randor UIColor

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .randomFloatValue(), green: .randomFloatValue(), blue: .randomFloatValue(), alpha: 0.6)
    }
}

extension CGFloat {
    static func randomFloatValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
