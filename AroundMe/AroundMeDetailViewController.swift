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

class AroundMeDetailViewController: UIViewController, MKMapViewDelegate {
    var business: Business?
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        self.mapView.delegate = self
        updateUI()
    }
    
    @IBOutlet weak var aroundMeTitle: UILabel!
    
    @IBOutlet weak var aroundMeImage: UIImageView!

    @IBOutlet weak var aroundMeAddress: UILabel!
    @IBOutlet weak var aroundMeRating: UIImageView!

    @IBOutlet weak var aroundMeDistance: UILabel!
    @IBOutlet weak var aroundMeNumberOfReviews: UILabel!
    @IBOutlet weak var aroundMeClosed: UILabel!
    
    func updateUI() {
        if business != nil {
            aroundMeTitle.text = "\(business!.name)"
            if business!.imageUrl != nil {
                aroundMeImage.kf_setImageWithURL(business!.imageUrl!)
            } else {
                aroundMeImage.image = UIImage(named: "business")
            }
            aroundMeImage.layer.cornerRadius = CGFloat(3.0)
            aroundMeRating.kf_setImageWithURL(business!.ratingImage)
            aroundMeAddress.text = business!.businessLocation
            aroundMeDistance.text = business!.businessDistance
            aroundMeNumberOfReviews.text = business!.businessNumberOfReviews
            
            //map pin
            let pin = CLLocationCoordinate2DMake(business!.location.latitude, business!.location.longitude)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = pin
            dropPin.title = business!.name
            dropPin.subtitle = business!.location.address
            mapView.addAnnotation(dropPin)
            //Source center:http://stackoverflow.com/a/28289351/2523667
            let span = MKCoordinateSpanMake(0.010, 0.010)
            let region = MKCoordinateRegion(center: pin, span: span)
            mapView.setRegion(region, animated: true)

        }
    }
    
}
