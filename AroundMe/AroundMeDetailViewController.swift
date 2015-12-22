//
//  AroundMeDetailViewController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 22/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import Kingfisher
import MapKit

class AroundMeDetailViewController: UIViewController {
    var business: Business?
    
    override func viewDidLoad() {
        updateUI()
    }
    
    @IBOutlet weak var aroundMeTitle: UILabel!
    
    @IBOutlet weak var aroundMeImage: UIImageView!

    @IBOutlet weak var aroundMeAddress: UILabel!
    @IBOutlet weak var aroundMeRating: UIImageView!
    @IBOutlet weak var aroundMeDistance: UILabel!
    
    func updateUI() {
        if business != nil {
            aroundMeTitle.text = "\(business!.name)"
            if business!.imageUrl != nil {
                aroundMeImage.kf_setImageWithURL(business!.imageUrl!)
            } else {
                aroundMeImage.image = UIImage(named: "resto")
            }
            aroundMeImage.layer.cornerRadius = CGFloat(3.0)
            aroundMeRating.kf_setImageWithURL(business!.ratingImage)
            aroundMeAddress.text = business!.businessLocation
            aroundMeDistance.text = business!.businessDistance
        }
    }
}
