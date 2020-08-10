//
//  CardView.swift
//  ParallaxSectionExample
//
//  Created by Hubilo Softech Private Limited on 10/08/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

enum CardType {
    case top
    case middle
    case bottom
    case single
}
class CardView: UIView {
    var type: CardType = .single
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = type == .middle ? 0 : 5
        switch type {
        case .single:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .top:
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottom:
            layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .middle:
            layer.maskedCorners = []
        }
        addshadow(top: (type == .single || type == .top), left: true, bottom: (type == .single || type == .bottom), right: true, shadowRadius: 3, opacity: 0.8)
    }
}
