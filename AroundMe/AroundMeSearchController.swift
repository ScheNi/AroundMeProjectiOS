//
//  AroundMeSearchController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 22/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit

class AroundMeSearchController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let vc = segue.destinationViewController as? AroundMeTableViewController {
            //Source trim: http://stackoverflow.com/a/26797958/2523667
            let searchString: String
            if (self.searchTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == "") {
                searchString = "Restaurants"
            } else {
                searchString = searchTextField.text!
            }
            vc.title = searchString
            vc.service.searchAroundMe(searchString,
                success: { (data, response) -> Void in
                    print(response)
                    vc.businesses += ParseService.parseBusiness(data)
                    
                })
                { (error) -> Void in
                    print(error)
                }
        }
        
    }
}
