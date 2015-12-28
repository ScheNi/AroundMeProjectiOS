//
//  Region.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 28/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation
struct Region {
    let latitudeDelta: Double
    let longitudeDelta: Double
    let centerLatitude: Double
    let centerLongitude: Double
    
    init(latitudeDelta: Double, longitudeDelta: Double, centerLatitude: Double, centerLongitude: Double) {
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
        self.centerLongitude = centerLongitude
        self.centerLatitude = centerLatitude
    }
}