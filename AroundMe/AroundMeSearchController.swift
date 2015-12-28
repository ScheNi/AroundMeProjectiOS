//
//  AroundMeSearchController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 22/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import CoreLocation
import SwiftSpinner
// picker view: https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIPickerView.html and https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPickerView_Class/
class AroundMeSearchController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate, UISplitViewControllerDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var sortPickerView: UIPickerView!
    
    
    var locationManager: CLLocationManager!
    var placeMark: CLPlacemark! = nil {
        didSet {
            SwiftSpinner.hide()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController!.delegate = self
        self.sortPickerView.dataSource = self;
        self.sortPickerView.delegate = self;
        
        //Source location: https://itunesu.itunes.apple.com/WebObjects/LZDirectory.woa/ra/directory/courses/961180099/feed and http://rshankar.com/get-your-current-address-in-swift/
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = manager.location {
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                
                if placemarks!.count > 0 {
                    let pm = placemarks![0] as CLPlacemark
                    self.placeMark = pm
                } else {
                    print("Problem with the data received from geocoder")
                }
            })

        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Filters.sortFilters.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Filters.sortFilters[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let vc = (segue.destinationViewController as! UINavigationController).topViewController as? AroundMeTableViewController {
            //Source trim: http://stackoverflow.com/a/26797958/2523667
            let searchString: String
            
            if (self.searchTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == "") {
                // If user hasn't filled anything in, use the default in Filters
                searchString = Filters.defaultSearchString
            } else {
                searchString = searchTextField.text!
            }
            vc.title = searchString
            let row = sortPickerView.selectedRowInComponent(0)
            let street = self.placeMark.name!.stringByReplacingOccurrencesOfString(" ", withString: "+")
            let location = "\(street)+\(self.placeMark.postalCode!)+\(self.placeMark.locality!),+\(self.placeMark.country!)"
            vc.searchParameters = SearchParameters(searchTerm: searchString, location: location, sortedBy: row)
            self.locationManager.stopUpdatingLocation()
            vc.loadData()
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        if placeMark == nil {
            SwiftSpinner.show("Getting your location")
        }
        locationManager.startUpdatingLocation()
    }
}
