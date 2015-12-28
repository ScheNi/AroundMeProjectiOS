//
//  LaunchScreenController.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 28/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import VideoSplash

class LaunchScreenController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("people_walking", ofType: "mp4")!)
        self.videoFrame = view.frame
        self.fillMode = .ResizeAspectFill
        self.alwaysRepeat = true
        self.sound = true
        self.startTime = 12.0
        self.duration = 4.0
        self.alpha = 0.7
        self.backgroundColor = UIColor.blackColor()
        self.contentURL = url
        self.restartForeground = true
    }
}

