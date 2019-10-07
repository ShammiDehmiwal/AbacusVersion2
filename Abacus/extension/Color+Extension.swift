//
//  Color+Extension.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    @nonobjc class var cobalt: UIColor {
        return UIColor(red: 33.0 / 255.0, green: 80.0 / 255.0, blue: 162.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var macaroniAndCheese: UIColor {
        return UIColor(red: 247.0 / 255.0, green: 202.0 / 255.0, blue: 51.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var sage: UIColor {
        return UIColor(red: 123.0 / 255.0, green: 190.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var darkPeach: UIColor {
        return UIColor(red: 211.0 / 255.0, green: 116.0 / 255.0, blue: 103.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var coolBlue: UIColor {
        return UIColor(red: 54.0 / 255.0, green: 154.0 / 255.0, blue: 213.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var tomato: UIColor {
        return UIColor(red: 223.0 / 255.0, green: 72.0 / 255.0, blue: 58.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var veryLightPink: UIColor {
        return UIColor(white: 237.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var paleGreyBG: UIColor {
        return UIColor(red: 254.0 / 255.0, green: 253.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    @nonobjc class var greyishBrown: UIColor {
        return UIColor(white: 62.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var purplishGrey: UIColor {
        return UIColor(red: 105.0 / 255.0, green: 102.0 / 255.0, blue: 108.0 / 255.0, alpha: 1.0)
    }
    @nonobjc class var black: UIColor {
        return UIColor(red: 33.0 / 255.0, green: 32.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
    }
    
    
        public convenience init?(hex: String) {
            let r, g, b, a: CGFloat
            
            if hex.hasPrefix("#") {
                let start = hex.index(hex.startIndex, offsetBy: 1)
                let hexColor = String(hex[start...])
                
                if hexColor.count == 8 {
                    let scanner = Scanner(string: hexColor)
                    var hexNumber: UInt64 = 0
                    
                    if scanner.scanHexInt64(&hexNumber) {
                        r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                        g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                        b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                        a = CGFloat(hexNumber & 0x000000ff) / 255
                        
                        self.init(red: r, green: g, blue: b, alpha: a)
                        return
                    }
                }
            }
            
            return nil
        }
    
}
