//
//  TableViewCell.swift
//  abscond
//
//  Created by William Cremin on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var destinationLabel: UILabel!
    
    var flight: Flight? {
        didSet {
            self.formatDates()
            self.priceLabel.text = self.flight!.formattedPrice
            guard let flight = self.flight, finalDestinationSegment = flight.legs[0].flightSegments.last else { return }
            let splitDestination = finalDestinationSegment.arrivalAirportLocation.componentsSeparatedByString(",")
//            let finalDestinationSegment = self.flight?.legs[0].flightSegments.last
//            let fullDestination = self.flight!.legs[0].flightSegments.last.arrivalAirportLocation
//            let splitDestination = fullDestination.componentsSeparatedByString(",")
            self.destinationLabel.text = splitDestination[0]
        }
    }
    
    func formatDates() {
        let dateFormatterInput = NSDateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        
        let dateFormatterOutput = NSDateFormatter()
        dateFormatterOutput.locale = NSLocale.currentLocale()
        dateFormatterOutput.dateFormat = "E MMM d"
        
        let departOriginalString = self.flight!.legs[0].flightSegments[0].departureTimeRaw
        let departDate = dateFormatterInput.dateFromString(departOriginalString)
        let departFormattedString = dateFormatterOutput.stringFromDate(departDate!)
        
        let returnOriginalString = self.flight!.legs[1].flightSegments.last!.arrivalTimeRaw
        let returnDate = dateFormatterInput.dateFromString(returnOriginalString)
        let returnFormattedString = dateFormatterOutput.stringFromDate(returnDate!)
        
        self.dateLabel.text = "\(departFormattedString) to \(returnFormattedString)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 210.0 / 255.0, blue: 0.0, alpha: 1.0)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
