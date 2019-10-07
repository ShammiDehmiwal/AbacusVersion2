//
//  ViewCornerShadowExtension.swift
//  Abacus
//
//  Created by Reena on 29/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class InnerDropShadowView: UIView {
    override func draw(_ rect: CGRect) {
        //Drawing code
        let context = UIGraphicsGetCurrentContext()
        //// Shadow Declarations
        let shadow: UIColor? = UIColor.init(white: 0.8, alpha: 1.0)//UIColor(hex: "a3a3a3")?.withAlphaComponent(1)//UIColor.init(hexString: "a3a3a3", alpha: 1.0) //UIColor.black.withAlphaComponent(0.6) //UIColor.init(hexString: "d7d7da", alpha: 1.0)
       
        
        let shadowOffset = CGSize(width: 0, height: 0)
        let shadowBlurRadius: CGFloat = 10.5
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(rect: bounds)
        UIColor.white.setFill()
        rectanglePath.fill()
        ////// Rectangle Inner Shadow
        context?.saveGState()
        UIRectClip(rectanglePath.bounds)
        context?.setShadow(offset: CGSize.zero, blur: 0, color: nil)
        context?.setAlpha((shadow?.cgColor.alpha)!)
        context?.beginTransparencyLayer(auxiliaryInfo: nil)
        do {
            let opaqueShadow: UIColor? = shadow?.withAlphaComponent(1)
            context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: opaqueShadow?.cgColor)
            context!.setBlendMode(.sourceOut)
            context?.beginTransparencyLayer(auxiliaryInfo: nil)
            opaqueShadow?.setFill()
            rectanglePath.fill()
            context!.endTransparencyLayer()
        }
        context!.endTransparencyLayer()
        context?.restoreGState()
    }
}



/*
import UIKit

@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}
*/
