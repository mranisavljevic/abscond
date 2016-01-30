//
//  BitlyAPI.swift
//  abscond
//
//  Created by William Cremin on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

let bitlyURL = "https://api-ssl.bitly.com/v3/shorten?access_token="
let bitlyToken = "affd98517210f91849662880d39d9c1752ed155d"

class BitlyAPI {
    
    class func shortenURL(longURL: String, completion: (success: Bool, newURL: String?)->()) {
        let allowed = NSMutableCharacterSet.alphanumericCharacterSet()
        guard let encodedLongURL = longURL.stringByAddingPercentEncodingWithAllowedCharacters(allowed) else { return }
        let urlString = "\(bitlyURL)\(bitlyToken)&longUrl=\(encodedLongURL)&format=txt"
        guard let url = NSURL(string: urlString) else { return }
        let request = NSURLRequest(URL: url)
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                if let shortURL = String(data: data, encoding: NSUTF8StringEncoding) {
                    completion(success: true, newURL: shortURL)
                }
            }
            if let _ = error {
                if let response = response as? NSHTTPURLResponse {
                    print(response.statusCode)
                }
            }
        }.resume()
    }
    
}
