//
//  FlightDetailViewController.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class FlightDetailViewController: UIViewController {
    
    var flight: Flight? {
        didSet {
            guard let flight = self.flight else { return }
            self.viewModel = FlightDetailViewModel(flight: flight)
        }
    }
    private var viewModel: FlightDetailViewModel? {
        didSet {
            guard let model = self.viewModel else { return }
            print(model.detailsUrl)
        }
    }
    
    class func identifier() -> String {
        return "FlightDetailViewController"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

