//
//  FlightDetailViewController.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class FlightDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    class func identifier() -> String {
        return "FlightDetailViewController"
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var seatsRemainingLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var segmentCollectionView: UICollectionView!
    
    var flight: Flight? {
        didSet {
            guard let flight = self.flight else { return }
            self.viewModel = FlightDetailViewModel(flight: flight)
        }
    }
    
    var flightSegments = [String]() {
        didSet {
            self.segmentCollectionView.reloadData()
        }
    }
    
    private var viewModel: FlightDetailViewModel? {
        didSet {
            guard let model = self.viewModel else { return }
            self.priceLabel.text = model.price
            self.seatsRemainingLabel.text = "\(model.seatsRemaining) SEATS LEFT!"
            self.flightSegments = model.legs
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.buyButton.layer.cornerRadius = self.buyButton.frame.size.width / 2
        self.segmentCollectionView.delegate = self
        self.segmentCollectionView.dataSource = self
        let nib = UINib(nibName: "FlightDetailCollectionViewCell", bundle: nil)
        self.segmentCollectionView.registerNib(nib, forCellWithReuseIdentifier: "FlightDetailCollectionViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buyButtonPressed(sender: UIButton) {
        
    }
    
    //MARK: UICollectionViewDelegate/Datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.flightSegments.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FlightDetailCollectionViewCell", forIndexPath: indexPath) as! FlightDetailCollectionViewCell
        cell.segmentString = self.flightSegments[indexPath.row]
        return cell
    }
    
    //MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(4.0, 4.0, 4.0, 4.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 4.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.frame.width - 8.0, 100.0)
    }

}

