//
//  FlightDetailCollectionViewCell.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/30/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class FlightDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var segmentLabel: UILabel!
    
    var segmentString: String? {
        didSet {
            guard let segment = self.segmentString else { return }
            self.segmentLabel.text = segment
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
