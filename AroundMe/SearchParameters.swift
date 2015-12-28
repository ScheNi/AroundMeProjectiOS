//
//  SearchParameters.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 28/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation

struct SearchParameters {
    let searchTerm : String
    let location: String
    let sortedBy: String
    var offset=0
    
    var loadedFirstTime:Bool {
        get {
            return offset == 0
        }
    }
    
    init(searchTerm: String, location: String, sortedBy: Int){
        self.searchTerm = searchTerm
        self.location = location
        self.sortedBy = String(sortedBy)
    }
    
    mutating func increaseOffset() {
        if offset == 0 {
            offset=10
        }
        offset = offset*2
    }
    
    
}