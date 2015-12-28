//
//  OAuthService.swift
//  AroundMe
//
//  Created by Nicolas Schelkens on 20/12/15.
//  Copyright © 2015 Nicolas Schelkens. All rights reserved.
//

import Foundation
import OAuthSwift

class OAuthService {
    
    let properties: NSDictionary
    
    let baseUrl:String
    
    let oauthClient: OAuthSwiftClient?
    
    init() {
        //Source: splitview exercise course iOS
        let path = NSBundle.mainBundle().pathForResource("Properties", ofType: "plist")!
        properties = NSDictionary(contentsOfFile: path)!
        
        baseUrl = properties["baseUrl"] as! String
        let consumerKey = properties["consumerKey"] as! String
        let consumerSecret = properties["consumerSecret"] as! String
        let token = properties["token"] as! String
        let tokenSecret = properties["tokenSecret"] as! String
        
        oauthClient = OAuthSwiftClient(consumerKey: consumerKey, consumerSecret: consumerSecret, accessToken: token, accessTokenSecret: tokenSecret)
    }
    
    func searchAroundMe(parameters: SearchParameters, success: (data:NSData, response: NSHTTPURLResponse) -> (), failure: (failure: NSError) -> ()) {
        doRequest(["term":parameters.searchTerm, "location":parameters.location, "sort":parameters.sortedBy, "offset": String(parameters.offset)], success: success, failure: failure)
    }
    
    //Source: callback inspiration from http://stackoverflow.com/a/27393174/2523667 and use of https://github.com/OAuthSwift/OAuthSwift
    func doRequest(params: [String:String], success: (data:NSData, response: NSHTTPURLResponse) -> (), failure: (failure: NSError) -> ()) {
        oauthClient!.get("https://api.yelp.com/v2/search", parameters: params, headers: nil, success: success, failure: failure)

    }
    
}