//
//  AroundMeTableViewController.swift
//  
//
//  Created by Nicolas Schelkens on 20/12/15.
//
//

import UIKit
import CoreLocation

class AroundMeTableViewController: UITableViewController, CLLocationManagerDelegate {
    
    let service=OAuthService()
    let locationManager = CLLocationManager()
    
    var businesses = [Business]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension

        
        //Source location: https://itunesu.itunes.apple.com/WebObjects/LZDirectory.woa/ra/directory/courses/961180099/feed
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()


    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tableCell = sender as? AroundMeTableViewCell {
            if let vc = segue.destinationViewController as? AroundMeDetailViewController {
                vc.business = tableCell.business
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return businesses.count
    }


    private struct AroundMe {
        static let TableCell: String = "AroundMeCell"
    }


    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(AroundMe.TableCell, forIndexPath: indexPath) as! AroundMeTableViewCell
        
        cell.position = indexPath.row
        cell.business = businesses[indexPath.row]
        

        return cell
    }

}
