//
//  UIView+Utils.swift
//  ParallaxSectionExample
//
//  Created by Hubilo Softech Private Limited on 10/08/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

extension UIView {
    func addshadow(top: Bool,
                   left: Bool,
                   bottom: Bool,
                   right: Bool,
                   shadowRadius: CGFloat = 2.0, opacity:CGFloat = 0.3, shadowColor:UIColor = UIColor.gray.withAlphaComponent(0.8)) {
        
        self.layer.masksToBounds = false
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = Float(opacity)
        self.layer.shadowColor = shadowColor.cgColor
        
        let path = UIBezierPath()
        let x: CGFloat = 0
        var y: CGFloat = 0
        let viewWidth = self.frame.width
        var viewHeight = self.frame.height
        
        if (!top) {
            y-=2
        }
        if (!bottom) {
            viewHeight+=2
        }
        // selecting top most point
        path.move(to: CGPoint(x: x, y: y))
        // Move to the Bottom Left Corner, this will cover left edges
        /*
         |☐
         */
        path.addLine(to: CGPoint(x: x, y: viewHeight))
        // Move to the Bottom Right Corner, this will cover bottom edge
        /*
         ☐
         -
         */
        path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        // Move to the Top Right Corner, this will cover right edge
        /*
         ☐|
         */
        path.addLine(to: CGPoint(x: viewWidth, y: y))
        // Move back to the initial point, this will cover the top edge
        /*
         _
         ☐
         */
        path.close()
        self.layer.shadowPath = path.cgPath
    }
}
