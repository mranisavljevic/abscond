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
            
            let fullDestination = self.flight!.legs[0].flightSegments[0].arrivalAirportLocation
            let splitDestination = fullDestination.componentsSeparatedByString(",")
            self.destinationLabel.text = splitDestination[0]
        }
    }
    
    func formatDates() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateFormat = "MMMM-d"
        
        let departOriginalString = self.flight!.legs[0].flightSegments[0].departureTimeRaw
        let departDate = dateFormatter.dateFromString(departOriginalString)
        let departFormattedString = dateFormatter.stringFromDate(departDate!)
        
        let returnOriginalString = self.flight!.legs[1].flightSegments.last!.arrivalTimeRaw
        let returnDate = dateFormatter.dateFromString(returnOriginalString)
        let returnFormattedString = dateFormatter.stringFromDate(returnDate!)
        
        self.dateLabel.text = "\(departFormattedString) TO \(returnFormattedString)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
