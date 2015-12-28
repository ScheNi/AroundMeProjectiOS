//
//  AroundMeTableViewController.swift
//  
//
//  Created by Nicolas Schelkens on 20/12/15.
//
//

import UIKit
import CoreLocation
import UIScrollView_InfiniteScroll
import SwiftSpinner


class AroundMeTableViewController: UITableViewController {
    
    let service=OAuthService()
    
    var searchParameters:SearchParameters?
    
    var businesses = [Business]() {
        didSet {
            tableView.reloadData()
        }
    }
    var region: Region!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
        tableView.infiniteScrollIndicatorStyle = .Gray
        
        tableView.addInfiniteScrollWithHandler { (scrollView) -> Void in
            let tableView = scrollView as! UITableView
            
            if self.searchParameters != nil {
                self.searchParameters?.increaseOffset()
                self.loadData()
            }
            
            
            tableView.finishInfiniteScroll()
        }
        
        
    }
    
    func loadData() {
        if let params = searchParameters {
            if (params.loadedFirstTime == true) { SwiftSpinner.show(searchParameters!.searchTerm) }
            self.service.searchAroundMe(params,
                success: { (data, response) -> Void in
                    print(response)
                    self.businesses += ParseService.parseBusiness(data)
                    self.region = ParseService.parseRegion(data)
                    if (params.loadedFirstTime == true) { SwiftSpinner.hide() }
                })
                { (error) -> Void in
                    print(error)
                }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tableCell = sender as? AroundMeTableViewCell {
            if let vc = segue.destinationViewController as? AroundMeDetailViewController {
                vc.business = tableCell.business
            }
        } else if let vc = (segue.destinationViewController as! UINavigationController).topViewController as? AroundMeMapViewController {
            vc.businesses = self.businesses
            vc.region = region
        }
    }

    override func traitCollectionDidChange(previousTraitCollection: UITraitCollection?) {
        if !splitViewController!.collapsed {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
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
