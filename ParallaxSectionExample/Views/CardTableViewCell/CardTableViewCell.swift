//
//  CardTableViewCell.swift
//  ParallaxSectionExample
//
//  Created by Hubilo Softech Private Limited on 10/08/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    @IBOutlet weak var card: CardView!
    @IBOutlet weak var cardTop: NSLayoutConstraint!
    @IBOutlet weak var cardBottom: NSLayoutConstraint!
    var type: CardType = .single {
        didSet {
            card.type = type
            switch type {
            case .single:
                cardTop.constant = 8
                cardBottom.constant = 8
            case .top:
                cardTop.constant = 8
                cardBottom.constant = 0
            case .middle:
                cardTop.constant = 0
                cardBottom.constant = 0
            case .bottom:
                cardTop.constant = 0
                cardBottom.constant = 8
            }
            self.contentView.layoutIfNeeded()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
