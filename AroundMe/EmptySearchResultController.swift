//
//  EmptySearchResultController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 28/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit

class EmptySearchResultController: UIViewController {
    @IBOutlet weak var message: UILabel!
    
    var errorMessage: String?
    
    override func viewDidLoad() {
        if errorMessage == nil {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
        } else {
            message.text = errorMessage!
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        if splitViewController!.displayMode == .PrimaryHidden && errorMessage == nil {
            let target = splitViewController!.displayModeButtonItem().target
            let action = splitViewController!.displayModeButtonItem().action
            target!.performSelector(action)
        }
    }
    
}
