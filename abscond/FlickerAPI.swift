//
//  FlickerAPI.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

// Place the key here///
let apiKey = "5949f992831cbbb97c3c2f0f43dce537"

class FlickerAPI {
    
    class func searchFlickrByTerm(searchTerm: String, completion: (success: Bool, data: NSData?) -> ()) {
        
        guard let escapedTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) else { return }

                let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(escapedTerm)&per_page=1&page=1&format=json&nojsoncallback=1"

        guard let url = NSURL(string: URLString)  else { return  }
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                completion(success: true, data: data)
            }
            if let _ = error {
                if let response = response as? NSHTTPURLResponse {
                    print("Error with code: \(response.statusCode)")
                    completion(success: false, data: nil)
                }
            }
    }.resume()
    }
    
    
//     private func createSearchURLForTerm(searchTerm: String) -> NSURL {
//        
//        let escapedTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
//        
//        print(escapedTerm)
//        
//        let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&text=\(escapedTerm)&per_page=20&format=json&nojsoncallback=1"
//        
//        return NSURL(string: URLString)!
//    }
}
