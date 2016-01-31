//
//  RandomAirportGenerator.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class RandomAirportGenerator {
    
   class func tenRandomAirports(airports:[String]) -> ([String], [String]) {
        
        var airportsToPickFrom = airports
        var arrivalAirports = [String]()

        for i in 0...9 {
            let randomIndex = Int(arc4random_uniform(UInt32(airports.count - 1 - i))) % airports.count
            arrivalAirports.append(airports[randomIndex])
            airportsToPickFrom.removeAtIndex(randomIndex)
        }
    return (arrivalAirports, airportsToPickFrom)
    }
}
