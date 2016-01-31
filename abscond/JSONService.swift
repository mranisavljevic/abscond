//
//  JSONService.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class JSONService {
    
    class func parseFlightSearchJSON(JSON: NSData) -> [Flight]? {
        do {
            guard let baseObject = try NSJSONSerialization.JSONObjectWithData(JSON, options: NSJSONReadingOptions.MutableContainers) as? [String : AnyObject] else { return nil }
            guard let legs = baseObject["legs"] as? [[String : AnyObject]], offers = baseObject["offers"] as? [[String : AnyObject]] else { return nil }
            var legsDictionary = [String : Leg]()
//            var departing: Bool = false
            for leg in legs {
//                departing = !departing
                guard let legId = leg["legId"] as? String else { return nil }
                guard let segments = leg["segments"] as? [[String : AnyObject]] else { return nil }
                var flightSegments = [FlightSegment]()
                for segment in segments {
                    guard let departureTimeRaw = segment["departureTimeRaw"] as? String, arrivalTimeRaw = segment["arrivalTimeRaw"] as? String, departureAirportCode = segment["departureAirportCode"] as? String, arrivalAirportCode = segment["arrivalAirportCode"] as? String, departureAirportLocation = segment["departureAirportLocation"] as? String, arrivalAirportLocation = segment["arrivalAirportLocation"] as? String, airlineName = segment["airlineName"] as? String, duration = segment["duration"] as? String else { return nil }
                    let flightSegment = FlightSegment(departureTime: departureTimeRaw, arrivalTime: arrivalTimeRaw, departureAirport: departureAirportCode, arrivalAirport: arrivalAirportCode, departureLocation: departureAirportLocation, arrivalLocation: arrivalAirportLocation, airlineName: airlineName, duration: duration, departing: true)
                    flightSegments.append(flightSegment)
                }
                let legObject = Leg(legId: legId, flightSegments: flightSegments)
                legsDictionary[legId] = legObject
            }
            var flightOffers = [Flight]()
            for offer in offers {
                guard let legIds = offer["legIds"] as? [String], averageTotalPricePerTicket = offer["averageTotalPricePerTicket"] as? [String : AnyObject], formattedPrice = averageTotalPricePerTicket["formattedPrice"] as? String, productKey = offer["productKey"] as? String, mobileShoppingKey = offer["mobileShoppingKey"] as? String, seatsRemaining = offer["seatsRemaining"] as? Int, detailsUrl = offer["detailsUrl"] as? String else { return nil }
                var offerLegs = [Leg]()
                var departing: Bool = false
                for legId in legIds {
                    departing = !departing
                    guard let legTemp = legsDictionary[legId] else { break }
                    for segment in legTemp.flightSegments {
                        segment.departing = departing
                    }
                    offerLegs.append(legTemp)
                }
                let flight = Flight(legs: offerLegs, formattedPrice: formattedPrice, productKey: productKey, mobileShoppingKey: mobileShoppingKey, seatsRemaining: seatsRemaining, detailsUrl: detailsUrl)
                flightOffers.append(flight)
            }
            if flightOffers.count > 0 {
                return flightOffers
            } else {
                return nil
            }
        } catch { return nil }
    }
}
