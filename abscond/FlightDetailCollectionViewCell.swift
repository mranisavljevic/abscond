//
//  FlightDetailCollectionViewCell.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class FlightDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var datesTimesLabel: UILabel!
    @IBOutlet weak var airportCodesLabel: UILabel!
    @IBOutlet weak var airlineLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!

    var segmentNumber: String?
    
    var segmentStrings: [String : AnyObject]? {
        didSet {
            guard let segment = self.segmentStrings, dates = segment["datesAndTimes"] as? String, airports = segment["airportCodes"] as? String, airline = segment["airline"] as? String, duration = segment["duration"] as? String, departing = segment["departing"] as? Bool else { return }
            self.datesTimesLabel.text = dates
            self.airportCodesLabel.text = airports
            self.airlineLabel.text = airline
            self.durationLabel.text = duration
            self.backgroundColor = departing ? kExpediaBlueTinted : kRedTinted
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
