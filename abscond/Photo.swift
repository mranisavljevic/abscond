//
//  Photo.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class Photo {
    let photoID: String
    let farm: Int
    let server: String
    let secret: String
    
    init(photoID: String, farm: Int, server: String, secret: String) {
        self.photoID = photoID
        self.farm = farm
        self.server = server
        self.secret = secret
    }
    
    func flickrImageURL() -> NSURL? {

        if let imageURL = NSURL(string: "http://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret).jpg") {
        return imageURL
        }
        return nil
    }
}


