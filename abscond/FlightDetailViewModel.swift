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
    let legs: String
    
    
    init(flight: Flight) {
        self.flight = flight
        self.price = flight.formattedPrice
        self.seatsRemaining = flight.seatsRemaining
        self.detailsUrl = flight.detailsUrl
        self.legs = FlightDetailViewModel.formatLegs(flight.legs)
    }
    
    private class func formatLegs(legs: [Leg]) -> String {
        return "Legs go here"
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