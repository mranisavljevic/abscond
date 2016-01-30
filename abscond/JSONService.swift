//
//  JSONService.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class JSONService {
    
    //Need to change this to a Flight class return value
    class func parseFlightSearchJSON(JSON: NSData) -> [String]? {
        do {
            guard let baseObject = try NSJSONSerialization.JSONObjectWithData(JSON, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] else { return nil }
            guard let legs = baseObject["legs"] as? [[String : AnyObject]], offers = baseObject["offers"] as? [[String : AnyObject]] else { return nil }
            var legsDictionary = [String : AnyObject]()
            for leg in legs {
                guard let legId = leg["legId"] as? String, departureTimeRaw = leg["departureTimeRaw"] as? String, arrivalTimeRaw = leg["arrivalTimeRaw"] as? String, departureAirportCode = leg["departureAirportCode"] as? String, arrivalAirportCode = leg["arrivalAirportCode"] as? String, departureAirportLocation = leg["departureAirportLocation"] as? String, arrivalAirportLocation = leg["arrivalAirportLocation"] as? String, airlineName = leg["airlineName"] as? String, duration = leg["duration"] as? String else { break }
                var legDictionary = [String : AnyObject]()
                legDictionary["legId"] = legId
                legDictionary["departureTimeRaw"] = departureTimeRaw
                legDictionary["arrivalTimeRaw"] = arrivalTimeRaw
                legDictionary["departureAirportCode"] = departureAirportCode
                legDictionary["arrivalAirportCode"] = arrivalAirportCode
                legDictionary["departureAirportLocation"] = departureAirportLocation
                legDictionary["arrivalAirportLocation"] = arrivalAirportLocation
                legDictionary["airlineName"] = airlineName
                legDictionary["duration"] = duration
                legsDictionary[legId] = legDictionary
            }
            for offer in offers {
                print(offer)
            }
        } catch { return nil }
        return nil
    }
}
