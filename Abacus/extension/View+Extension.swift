//
//  View+Extension.swift
//  Abacus
//
//  Created by Reena on 26/09/19.
//  Copyright © 2019 Doozycod. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

extension UIView {
    
    func dropShadow() {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 1 //0.5
        self.layer.shadowOffset = CGSize.zero//CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 5
       // self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = false
        self.layer.rasterizationScale = UIScreen.main.scale
        
       // self.layer.cornerRadius = 10
    }
    
    func addGreyDashedBorder() {
        let border = CAShapeLayer();
        border.strokeColor = UIColor.purplishGrey.cgColor;
        border.fillColor = nil;
        border.lineWidth = 2
        border.lineDashPattern = [10, 4];
        border.path = UIBezierPath(rect: self.bounds).cgPath
        border.frame = self.bounds;
        self.layer.addSublayer(border);
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
//        let path = UIBezierPath(roundedRect: self.frame, cornerRadius: 0)
//
//        UIColor.purple.setFill()
//        path.fill()
//
//         UIColor.purplishGrey.setStroke()
//        path.lineWidth = 5
//
//        let dashPattern : [CGFloat] = [10, 4]
//        path.setLineDash(dashPattern, count: 2, phase: 0)
//        path.stroke()
//
//        self.layer.addSublayer(path)
        
//        let shapeLayer:CAShapeLayer = CAShapeLayer()
//        let frameSize = self.frame.size
//      //  let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
//
//        shapeLayer.frame = self.frame
//        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
//        shapeLayer.fillColor = UIColor.clear.cgColor
//        shapeLayer.strokeColor = color
//        shapeLayer.lineWidth = 3
//        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
//        shapeLayer.lineDashPattern = [6,3]
//        shapeLayer.path = UIBezierPath(roundedRect: self.frame, cornerRadius: 8).cgPath
//
//        self.layer.addSublayer(shapeLayer)
    }
}
