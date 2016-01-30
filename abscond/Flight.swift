//
//  Flight.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

class Flight {
    let legs: [Leg]
    let formattedPrice: String
    let productKey: String
    let mobileShoppingKey: String
    let seatsRemaining: Int
    let detailsUrl: String
    
    init(legs: [Leg], formattedPrice: String, productKey: String, mobileShoppingKey: String, seatsRemaining: Int, detailsUrl: String) {
        self.legs = legs
        self.formattedPrice = formattedPrice
        self.productKey = productKey
        self.mobileShoppingKey = mobileShoppingKey
        self.seatsRemaining = seatsRemaining
        self.detailsUrl = detailsUrl
    }
}
