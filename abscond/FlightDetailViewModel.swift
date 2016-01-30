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
    let legs: [String]
    
    
    init(flight: Flight) {
        self.flight = flight
        self.price = flight.formattedPrice
        self.seatsRemaining = flight.seatsRemaining
        self.detailsUrl = flight.detailsUrl
        self.legs = FlightDetailViewModel.formatLegs(flight.legs)
    }
    
    private class func formatLegs(legs: [Leg]) -> [String] {
        var segmentsList = [String]()
        for leg in legs {
            for segment in leg.flightSegments {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
//                2016-02-07T14:35:00.000-08:00
                let durationFormatter = NSDateFormatter()
                durationFormatter.dateFormat = "vH'H':mm'M'"
                let departureDate = formatter.dateFromString(segment.departureTimeRaw)
                let arrivalDate = formatter.dateFromString(segment.arrivalTimeRaw)
                let durationTime = durationFormatter.dateFromString(segment.duration)
                guard let departure = departureDate, arrival = arrivalDate, duration = durationTime else { break }
                let departureTimeString = NSDateFormatter.localizedStringFromDate(departure, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                let arrivalTimeString = NSDateFormatter.localizedStringFromDate(arrival, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                let durationTimeString = NSDateFormatter.localizedStringFromDate(duration, dateStyle: NSDateFormatterStyle.NoStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                let segmentString = "\(departureTimeString) -> \(arrivalTimeString)\n\(segment.departureAirportCode) -> \(segment.arrivalAirportCode)\n\(segment.airlineName)\n\(durationTimeString)"
                segmentsList.append(segmentString)
            }
        }
        for segment in segmentsList {
            print(segment)
        }
        return segmentsList
    }
    
}



//let legs: [Leg]
//let formattedPrice: String
//let productKey: String
//let mobileShoppingKey: String
//let seatsRemaining: Int
//let detailsUrl: String
//
//
//let legId: String
//let flightSegments: [FlightSegment]
//
//let departureTimeRaw: String
//let arrivalTimeRaw: String
//let departureAirportCode: String
//let arrivalAirportCode: String
//let departureAirportLocation: String
//let arrivalAirportLocation: String
//let airlineName: String
//let duration: String