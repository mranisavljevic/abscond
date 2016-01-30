//
//  BitlyAPI.swift
//  abscond
//
//  Created by William Cremin on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

let bitlyEndpoint = "https://api-ssl.bitly.com/v3/shorten?access_token="
let bitlyToken = "affd98517210f91849662880d39d9c1752ed155d"

class BitlyAPI {
    
    class func shortenURL(longURL: String, completion: (success: Bool, data: String)->()) {
        let urlString = "\(bitlyEndpoint)\(bitlyToken)&longUrl=\(longURL)&format=txt"
        guard let url = NSURL(string: urlString) else { return }
        
    }
    
}