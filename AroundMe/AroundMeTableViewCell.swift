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
    
    var position: Int?
    
    @IBOutlet weak var aroundMeImage: UIImageView!

    @IBOutlet weak var aroundMeTitle: UILabel!

    @IBOutlet weak var ratingImage: UIImageView!

    @IBOutlet weak var aroundMeAddress: UILabel!
    
    @IBOutlet weak var aroundMeDistance: UILabel!
    
    @IBOutlet weak var numberOfReviews: UILabel!
    
    func updateUI() {
        
        if business != nil {
            aroundMeTitle.text = "\(position!+1). \(business!.name)"
            if business!.imageUrl != nil {
                aroundMeImage.kf_setImageWithURL(business!.imageUrl!)
            } else {
                aroundMeImage.image = UIImage(named: "business")
            }
            aroundMeImage.layer.cornerRadius = CGFloat(3.0)
            ratingImage.kf_setImageWithURL(business!.ratingImage)
            aroundMeAddress.text = business!.businessLocation
            aroundMeDistance.text = business!.businessDistance
            numberOfReviews.text = business!.businessNumberOfReviews
        }
    }
}

