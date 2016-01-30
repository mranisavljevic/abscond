//
//  ExpediaAPI.swift
//  abscond
//
//  Created by Alberto Vega Gonzalez on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import Foundation

let expediaAPIClientID = "gbRHdVzCANW7BlkRXGNskrCdtN4wMVPA"
let expediaFlightSearchURL = "http://terminal2.expedia.com/x/mflights/search"


class ExpediaAPI {
    class func searchFlights(arrivalAirport:String, departureDate: String, returnDate: String, completion: (success: Bool, data: NSData?)->()) {
        let urlString = "\(expediaFlightSearchURL)?departureDate=\(departureDate)&returnDate=\(returnDate)&departureAirport=SEA&arrivalAirport=\(arrivalAirport)&prettyPrint=true&apikey=\(expediaAPIClientID)"
        guard let url = NSURL(string: urlString) else { return }
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let data = data {
                completion(success: true, data: data)
//                print("The data is: \(data)")
            }
            if let _ = error {
                if let response = response as? NSHTTPURLResponse {
                    print("Error with code: \(response.statusCode)")
                }
            }
            completion(success: false, data: nil)
            }.resume()
    }
}

