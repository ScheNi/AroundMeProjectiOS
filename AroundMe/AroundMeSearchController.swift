//
//  AroundMeSearchController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 22/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit
import SwiftSpinner

// picker view: https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/UIKitUICatalog/UIPickerView.html and https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIPickerView_Class/
class AroundMeSearchController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var sortPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortPickerView.dataSource = self;
        self.sortPickerView.delegate = self;
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
        
        if let vc = segue.destinationViewController as? AroundMeTableViewController {
            //Source trim: http://stackoverflow.com/a/26797958/2523667
            let searchString: String
            if (self.searchTextField.text?.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) == "") {
                // If user hasn't filled anything in, user Restaurant by default
                searchString = "Restaurants"
            } else {
                searchString = searchTextField.text!
            }
            vc.title = searchString
            let row = sortPickerView.selectedRowInComponent(0)
            SwiftSpinner.show("Getting results...")
            vc.service.searchAroundMe(searchString, sort: row,
                success: { (data, response) -> Void in
                    print(response)
                    vc.businesses += ParseService.parseBusiness(data)
                    SwiftSpinner.hide()
                    
                })
                { (error) -> Void in
                    print(error)
                }
        }
        
    }
}
