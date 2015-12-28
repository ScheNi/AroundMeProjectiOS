//
//  EmptySearchResultController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 28/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import UIKit

class EmptySearchResultController: UIViewController {
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
    }
    
    override func viewDidAppear(animated: Bool) {
        if splitViewController!.displayMode == .PrimaryHidden {
            let target = splitViewController!.displayModeButtonItem().target
            let action = splitViewController!.displayModeButtonItem().action
            target!.performSelector(action)
        }
    }
    
}
