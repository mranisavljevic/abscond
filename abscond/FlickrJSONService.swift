//
//  FlickrJSONService.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class FlickrJSONService {
    
    class func parsePhotoSearchJSON(JSON: NSData) -> [Photo]? {
        
        do {
            
            guard let resultsDictionary = try NSJSONSerialization.JSONObjectWithData(JSON, options: .MutableContainers) as? [String : AnyObject] else { return nil }
            
            guard let status = resultsDictionary["stat"] as? String else { return nil }
            print("The status of the call is \(status)")
            guard let photosDictionary = resultsDictionary["photos"] as? [String: AnyObject] else { return nil }
            guard let photosReceived = photosDictionary["photo"] as? [[String: AnyObject]] else { return nil }
            var photos = [Photo]()
            
            for photo in photosReceived {
            guard let photoID = photo["id"] as? String else { return  nil }
            guard let farm = photo["farm"] as? Int else { return nil }
            guard let server = photo["server"] as? String else { return nil }
            guard let secret = photo["secret"] as? String else { return nil }
            
            let flickrPhoto = Photo(photoID: photoID, farm: farm, server: server, secret: secret)
                
                photos.append(flickrPhoto)
            }
           return photos
            
        } catch { return nil }
    }
}
