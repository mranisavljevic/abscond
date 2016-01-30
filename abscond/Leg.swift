//
//  Leg.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class Leg {
    let legId: String
    let flightSegments: [FlightSegment]
    
    init(legId: String, flightSegments: [FlightSegment]) {
        self.legId = legId
        self.flightSegments = flightSegments
    }
    
}
