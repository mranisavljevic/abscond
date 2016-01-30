//
//  FlightDetailViewModel.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class FlightDetailViewModel {
    
    let flight: Flight
    let price: String
    let seatsRemaining: Int
    let detailsUrl: String
    let legs: [[String : String]]
    
    
    init(flight: Flight) {
        self.flight = flight
        self.price = flight.formattedPrice
        self.seatsRemaining = flight.seatsRemaining
        self.detailsUrl = flight.detailsUrl
        self.legs = FlightDetailViewModel.formatLegs(flight.legs)
    }
    
    private class func formatLegs(legs: [Leg]) -> [[String : String]] {
        var segmentsList = [[String : String]]()
        for leg in legs {
            for segment in leg.flightSegments {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                let characterSet = NSCharacterSet.letterCharacterSet()
                let durationString = segment.duration.componentsSeparatedByCharactersInSet(characterSet).joinWithSeparator(":")
//                let separatorIndex = durationString.startIndex.advancedBy((durationString.characters.count == 3 ? 1 : 2))
//                durationString.insert(":", atIndex: separatorIndex)
                let departureDate = formatter.dateFromString(segment.departureTimeRaw)
                let arrivalDate = formatter.dateFromString(segment.arrivalTimeRaw)
                guard let departure = departureDate, arrival = arrivalDate else { break }
                let departureTimeString = NSDateFormatter.localizedStringFromDate(departure, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                let arrivalTimeString = NSDateFormatter.localizedStringFromDate(arrival, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
//                let segmentString = "\(departureTimeString) -> \(arrivalTimeString)\n\(segment.departureAirportCode) -> \(segment.arrivalAirportCode)\nAirline: \(segment.airlineName)\nDuration: \(durationString)"
                let segmentDictionary = ["datesAndTimes" : "\(departureTimeString) -> \(arrivalTimeString)", "airportCodes" : "\(segment.departureAirportCode) -> \(segment.arrivalAirportCode)", "airline" : "Airline: \(segment.airlineName)", "duration" : "Duration: \(durationString)"]
                segmentsList.append(segmentDictionary)
            }
        }
//        var segmentDictionary = [String : String]()
//        for var i = 1; i <= segmentsList.count; i++ {
//            segmentDictionary["\(i)"] = segmentsList[i]
//        }
//        return segmentDictionary
        return segmentsList
    }
    
}
