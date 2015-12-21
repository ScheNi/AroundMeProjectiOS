//
//  Location.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 20/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation

struct Location {
    let latitude: Double
    let longitude: Double
    let address: String
    let city: String
    let postalCode: String
    
    init(latitude: Double, longitude: Double, address: String, city: String, postalCode: String) {
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
        self.city = city
        self.postalCode = postalCode
    }
 }