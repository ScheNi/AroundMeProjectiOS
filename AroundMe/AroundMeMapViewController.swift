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
    var annotations: [MKPointAnnotation]! = []
    var currenBusiness: Int!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func goToTableView(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        mapView.delegate = self
        if self.annotations.count != businesses.count {
            loadPins()
        }
    }
    
    func loadPins() {
        
        for business in businesses {
            //map pin
            let pin = CLLocationCoordinate2DMake(business.location.latitude, business.location.longitude)
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = pin
            dropPin.title = business.name
            dropPin.subtitle = business.location.address
            annotations.append(dropPin)
        }
        mapView.addAnnotations(annotations)
        let center = CLLocationCoordinate2DMake(self.region.centerLatitude, self.region.centerLongitude)
        //Source center:http://stackoverflow.com/a/28289351/2523667
        let span = MKCoordinateSpanMake(self.region.latitudeDelta, self.region.longitudeDelta)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)

    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        // Source: find index by object http://stackoverflow.com/a/24012417/2523667
        currenBusiness = (self.annotations as NSArray).indexOfObject(view.annotation!)
        if currenBusiness >= 0 {
            performSegueWithIdentifier("ShowDetails", sender: self)
        }
    }
    
    //Source adding button http://stackoverflow.com/a/33124302/2523667
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        //if is a userlocation, do not alter
        if (annotation.isKindOfClass(MKUserLocation)) {
            return nil;
        }
        
        var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as? MKPinAnnotationView
        
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            view!.canShowCallout = true
        } else {
            view!.annotation = annotation
        }
        
        view!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
        
        return view
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? AroundMeDetailViewController {
            vc.business = businesses[currenBusiness]
        }
    }
    
    override func viewDidLoad() {
        if let tab = tabBarController?.viewControllers![0] as? TableViewDelegate {
            //get businesses and region from tableviewcontroller
            self.businesses = tab.businesses
            self.region = tab.region
        }
    }
}
