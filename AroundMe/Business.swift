//
//  Business.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 20/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation

class Business {
    let name: String
    let imageUrl: NSURL?
    let ratingImage: NSURL
    let location: Location
    let distance: Double?
    let numberOfReviews: Int
    
    var businessLocation: String {
        get {
            return "\(self.location.address), \(self.location.postalCode) \(self.location.city)"
        }
    }
    
    var businessDistance: String {
        get {
            if distance != nil {
                return String(format: "%.0f m", arguments: [distance!])
            }
            return ""
        }
    }
    
    var businessNumberOfReviews: String {
        get {
            return "\(self.numberOfReviews) reviews"
        }
    }
    
    init(name: String, image: String?, rating: String, location: Location, distance: Double?, numberOfReviews: Int) {
        self.name = name
        if image != nil {
            self.imageUrl = NSURL(string: image!)!
        } else {
            self.imageUrl = nil
        }
        self.ratingImage = NSURL(string: rating)!
        self.location = location
        self.distance = distance
        self.numberOfReviews = numberOfReviews
    }
    
}