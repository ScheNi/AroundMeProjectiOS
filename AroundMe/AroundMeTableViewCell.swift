//
//  AroundMeTableViewCell.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 20/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import Kingfisher

class AroundMeTableViewCell: UITableViewCell {

    var business : Business? {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var aroundMeImage: UIImageView!

    @IBOutlet weak var aroundMeTitle: UILabel!

    @IBOutlet weak var ratingImage: UIImageView!

    @IBOutlet weak var aroundMeAddress: UILabel!
    
    @IBOutlet weak var aroundMeDistance: UILabel!
    
    func updateUI() {
        if business != nil {
            aroundMeTitle.text = business!.name
            if business!.imageUrl != nil {
                aroundMeImage.kf_setImageWithURL(business!.imageUrl!)
            } else {
                aroundMeImage.image = UIImage(named: "resto")
            }
            
            ratingImage.kf_setImageWithURL(business!.ratingImage)
            aroundMeAddress.text = business!.businessLocation
            aroundMeDistance.text = business?.businessDistance
        }
    }
}
