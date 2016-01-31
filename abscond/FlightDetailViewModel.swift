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
    let legs: [[String : AnyObject]]
    
    
    init(flight: Flight) {
        self.flight = flight
        self.price = flight.formattedPrice
        self.seatsRemaining = flight.seatsRemaining
        self.detailsUrl = flight.detailsUrl
        self.legs = FlightDetailViewModel.formatLegs(flight.legs)
    }
    
    private class func formatLegs(legs: [Leg]) -> [[String : AnyObject]] {
        var segmentsList = [[String : AnyObject]]()
        for leg in legs {
            for segment in leg.flightSegments {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
                var durationString = segment.duration.substringFromIndex(segment.duration.startIndex.advancedBy(2))
                durationString = durationString.substringToIndex(durationString.startIndex.advancedBy(durationString.characters.count - 1))
                durationString = durationString.containsString("H") ? FlightDetailViewModel.padMinutesWithZeros(durationString.componentsSeparatedByString("H")).joinWithSeparator(":") : "0:\(durationString.characters.count > 1 ? durationString : (durationString.characters.count == 1 ? "0\(durationString)" : "00"))"
                let departureDate = formatter.dateFromString(segment.departureTimeRaw)
                let arrivalDate = formatter.dateFromString(segment.arrivalTimeRaw)
                guard let departure = departureDate, arrival = arrivalDate else { break }
                let departureTimeString = NSDateFormatter.localizedStringFromDate(departure, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                let arrivalTimeString = NSDateFormatter.localizedStringFromDate(arrival, dateStyle: NSDateFormatterStyle.ShortStyle, timeStyle: NSDateFormatterStyle.ShortStyle)
                var segmentDictionary = [String : AnyObject]()
                segmentDictionary["datesAndTimes"] = "\(departureTimeString) -> \(arrivalTimeString)"
                segmentDictionary["airportCodes"] = "\(segment.departureAirportCode) -> \(segment.arrivalAirportCode)"
                segmentDictionary["airline"] = "Airline: \(segment.airlineName)"
                segmentDictionary["duration"] = "Duration: \(durationString)"
                segmentDictionary["departing"] = segment.departing
                segmentsList.append(segmentDictionary)
            }
        }
        return segmentsList
    }
    
    private class func padMinutesWithZeros(time: [String]) -> [String] {
        var tempList = [time[0]]
        for var i = 1; i < time.count; i++ {
            let tempString = (time[i].characters.count > 1 ? time[i] : (time[i].characters.count == 1 ? "0\(time[i])" : "00"))
            tempList.append(tempString)
        }
        return tempList
    }

    
}
