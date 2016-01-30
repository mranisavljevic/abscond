//
//  FlightSegment.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class FlightSegment {
    
    let departureTimeRaw: String
    let arrivalTimeRaw: String
    let departureAirportCode: String
    let arrivalAirportCode: String
    let departureAirportLocation: String
    let arrivalAirportLocation: String
    let airlineName: String
    let duration: String
    var departing: Bool
    
    init(departureTime: String, arrivalTime: String, departureAirport: String, arrivalAirport: String, departureLocation: String, arrivalLocation: String, airlineName: String, duration: String, departing: Bool) {
        self.departureTimeRaw = departureTime
        self.arrivalTimeRaw = arrivalTime
        self.departureAirportCode = departureAirport
        self.arrivalAirportCode = arrivalAirport
        self.departureAirportLocation = departureLocation
        self.arrivalAirportLocation = arrivalLocation
        self.airlineName = airlineName
        self.duration = duration
        self.departing = departing
    }
    
    
}
