//
//  ParseService.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 21/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation
import SwiftyJSON

class ParseService {
    static func parseBusiness (data: NSData) -> [Business] {
        let json = JSON(data: data)
        var businesses: [Business] = []
        
        for (_, value):(String, JSON) in json["businesses"] {
            
            let name = value["name"].string
            let image = value["image_url"].string
            let ratingImg = value["rating_img_url"].string
            //distance is only returned when sending request with a specific address
            let distance = value["distance"].double
            let numberOfReviews = value["review_count"].int
            
            let location = value["location"]
            let address = location["address"][0].string
            let city = location["city"].string
            let postalCode = location["postal_code"].string
            let coordinate = location["coordinate"]
            let longitude = coordinate["longitude"].double
            let latitude = coordinate["latitude"].double
            
            
            let businessLocation:Location?
            if address != nil && city != nil && postalCode != nil && longitude != nil && latitude != nil {
                businessLocation = Location(latitude: latitude!, longitude: longitude!, address: address!, city: city!, postalCode: postalCode!)
            } else {
                businessLocation = nil
            }
            
            if name != nil && ratingImg != nil && businessLocation != nil && numberOfReviews != nil {
                businesses.append(Business(name: name!, image: image, rating: ratingImg!, location: businessLocation!, distance: distance, numberOfReviews: numberOfReviews!))
            }
        }
        return  businesses
    }
}