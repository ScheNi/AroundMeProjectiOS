//
//  AroundMeMapViewController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 22/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import MapKit

class AroundMeMapViewController: UIViewController, MKMapViewDelegate {

    var businesses: [Business]!
    var region: Region!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func goToTableView(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        mapView.delegate = self
        loadPins()
    }
    
    func loadPins() {
        
        for business in businesses {
            //map pin
            let pin = CLLocationCoordinate2DMake(business.location.latitude, business.location.longitude)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = pin
            dropPin.title = business.name
            dropPin.subtitle = business.location.address
            mapView.addAnnotation(dropPin)
        }
        let center = CLLocationCoordinate2DMake(self.region.centerLatitude, self.region.centerLongitude)
        //Source center:http://stackoverflow.com/a/28289351/2523667
        let span = MKCoordinateSpanMake(self.region.latitudeDelta, self.region.longitudeDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)

    }
    
}
