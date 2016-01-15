//
//  AroundMeTableViewController.swift
//  
//
//  Created by Nicolas Schelkens on 20/12/15.
//
//

import UIKit
import UIScrollView_InfiniteScroll


class AroundMeTableViewController: UITableViewController, TableViewDelegate {

    
    var searchDelegate: SearchDelegate?
    
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
        
            if let search = self.searchDelegate {
                if search.searchParameters != nil {
                    //search is immutable...
                    search.loadMoreData({(data, response) -> Void in
                        self.businesses += ParseService.parseBusiness(data)
                        tableView.finishInfiniteScroll()
                    }, failure: {(error) -> Void in
                        //there are no more items to be fetched
                        tableView.finishInfiniteScroll()
                    
                    })
                }
                
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
            vc.title = self.title
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


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.TableCell, forIndexPath: indexPath) as! AroundMeTableViewCell
        
        cell.position = indexPath.row
        cell.business = businesses[indexPath.row]
        

        return cell
    }

}

protocol TableViewDelegate {
    var businesses: [Business] {get}
    var region: Region! {get}
}
