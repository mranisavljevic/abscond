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
                guard let legId = leg["legId"] as? String else { return nil }
                guard let segments = leg["segments"] as? [[String : AnyObject]] else { return nil }
                var flightSegments = [FlightSegment]()
                for segment in segments {
                    guard let departureTimeRaw = segment["departureTimeRaw"] as? String else { return nil }
                    guard let arrivalTimeRaw = segment["arrivalTimeRaw"] as? String else { return nil }
                    guard let departureAirportCode = segment["departureAirportCode"] as? String else { return nil }
                    guard let arrivalAirportCode = segment["arrivalAirportCode"] as? String else { return nil }
                    guard let departureAirportLocation = segment["departureAirportLocation"] as? String else { return nil }
                    guard let arrivalAirportLocation = segment["arrivalAirportLocation"] as? String else { return nil }
                    guard let airlineName = segment["airlineName"] as? String else { return nil }
                    guard let duration = segment["duration"] as? String else { return nil }
                    let flightSegment = FlightSegment(departureTime: departureTimeRaw, arrivalTime: arrivalTimeRaw, departureAirport: departureAirportCode, arrivalAirport: arrivalAirportCode, departureLocation: departureAirportLocation, arrivalLocation: arrivalAirportLocation, airlineName: airlineName, duration: duration)
                    flightSegments.append(flightSegment)
                }
                let legObject = Leg(legId: legId, flightSegments: flightSegments)
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
