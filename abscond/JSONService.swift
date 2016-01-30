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
    class func parseFlightSearchJSON(JSON: NSData) -> [Flight]? {
        do {
            guard let baseObject = try NSJSONSerialization.JSONObjectWithData(JSON, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] else { return nil }
            guard let legs = baseObject["legs"] as? [[String : AnyObject]], offers = baseObject["offers"] as? [[String : AnyObject]] else { return nil }
            var legsDictionary = [String : Leg]()
            for leg in legs {
                guard let legId = leg["legId"] as? String, departureTimeRaw = leg["departureTimeRaw"] as? String, arrivalTimeRaw = leg["arrivalTimeRaw"] as? String, departureAirportCode = leg["departureAirportCode"] as? String, arrivalAirportCode = leg["arrivalAirportCode"] as? String, departureAirportLocation = leg["departureAirportLocation"] as? String, arrivalAirportLocation = leg["arrivalAirportLocation"] as? String, airlineName = leg["airlineName"] as? String, duration = leg["duration"] as? String else { return nil }
                let legObject = Leg(legId: legId, departureTime: departureTimeRaw, arrivalTime: arrivalTimeRaw, departureAirport: departureAirportCode, arrivalAirport: arrivalAirportCode, departureLocation: departureAirportLocation, arrivalLocation: arrivalAirportLocation, airlineName: airlineName, duration: duration)
                legsDictionary[legId] = legObject
//                var legDictionary = [String : AnyObject]()
//                legDictionary["legId"] = legId
//                legDictionary["departureTimeRaw"] = departureTimeRaw
//                legDictionary["arrivalTimeRaw"] = arrivalTimeRaw
//                legDictionary["departureAirportCode"] = departureAirportCode
//                legDictionary["arrivalAirportCode"] = arrivalAirportCode
//                legDictionary["departureAirportLocation"] = departureAirportLocation
//                legDictionary["arrivalAirportLocation"] = arrivalAirportLocation
//                legDictionary["airlineName"] = airlineName
//                legDictionary["duration"] = duration
//                legsDictionary[legId] = legDictionary
                
            }
            var flightOffers = [Flight]()
            for offer in offers {
                guard let legIds = offer["legIds"] as? [String], averageTotalPricePerTicket = offer["averageTotalPricePerTicket"] as? [String : AnyObject], formattedPrice = averageTotalPricePerTicket["formattedPrice"] as? String, productKey = offer["productKey"] as? String, mobileShoppingKey = offer["mobileShoppingKey"] as? String, seatsRemaining = offer["seatsRemaining"] as? Int, detailsUrl = offer["detailsUrl"] as? String else { return nil }
                var offerLegs = [Leg]()
                for legId in legIds {
                    guard let legTemp = legsDictionary[legId] else { break }
                    offerLegs.append(legTemp)
                }
                let flight = Flight(legs: offerLegs, formattedPrice: formattedPrice, productKey: productKey, mobileShoppingKey: mobileShoppingKey, seatsRemaining: seatsRemaining, detailsUrl: detailsUrl)
                flightOffers.append(flight)
//                var offerLegs = [String : AnyObject]()
//                for legId in legIds {
//                    offerLegs["legId"] = legsDictionary[legId]
//                }
//                var offerDictionary = [String : AnyObject]()
//                offerDictionary["legs"] = offerLegs
//                offerDictionary["formattedPrice"] = formattedPrice
//                offerDictionary["productKey"] = productKey
//                offerDictionary["mobileShoppingKey"] = mobileShoppingKey
//                offerDictionary["seatsRemaining"] = seatsRemaining
//                offerDictionary["detailsUrl"] = detailsUrl
//                flightOffers.append(offerDictionary)
            }
            if flightOffers.count > 0 {
                return flightOffers
            } else {
                return nil
            }
        } catch { return nil }
    }
}
