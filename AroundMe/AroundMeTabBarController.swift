

//
//  AroundMeTabBarController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 15/01/16.
//  Copyright © 2016 Nicolas Schelkens. All rights reserved.
//

import UIKit

class AroundMeTabBarController: UITabBarController {

    override func viewDidLoad() {
        if self.splitViewController!.displayMode == UISplitViewControllerDisplayMode.PrimaryHidden || self.splitViewController!.displayMode == UISplitViewControllerDisplayMode.PrimaryOverlay  {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem()
        }
        
    }
    
}
