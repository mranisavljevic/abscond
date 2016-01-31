//
//  FlightDetailViewController.swift
//  abscond
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit
import SafariServices

class FlightDetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, SFSafariViewControllerDelegate {
    
    class func identifier() -> String {
        return "FlightDetailViewController"
    }
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var seatsRemainingLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var segmentCollectionView: UICollectionView!
    
    var flight: Flight?
    
    var flightSegments = [[String : AnyObject]]() {
        didSet {
            self.segmentCollectionView.reloadData()
        }
    }
    
    private var viewModel: FlightDetailViewModel? {
        didSet {
            guard let model = self.viewModel else { return }
            self.priceLabel.text = model.price
            self.seatsRemainingLabel.text = model.seatsRemaining == 1 ? "\(model.seatsRemaining) SEAT LEFT!" : "\(model.seatsRemaining) SEATS LEFT!"
//            var flightSegmentTemp = [String]()
//            for var i = 1; i <= model.legs.count; i++ {
//                guard let string = model.legs["\(i)"] else { break }
//                flightSegmentTemp.append(string)
//            }
//            self.flightSegments = flightSegmentTemp
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
        if let flight = self.flight {
            self.viewModel = FlightDetailViewModel(flight: flight)
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func buyButtonPressed(sender: UIButton) {
        guard let flight = self.flight else { return }
        let allowedCharacters = NSCharacterSet.URLQueryAllowedCharacterSet()
        guard let convertedUrl = flight.detailsUrl.stringByAddingPercentEncodingWithAllowedCharacters(allowedCharacters), detailsUrl = NSURL(string: convertedUrl) else { return }
        print(convertedUrl)
        let safariVC = SFSafariViewController(URL: detailsUrl, entersReaderIfAvailable: true)
        safariVC.delegate = self
        self.presentViewController(safariVC, animated: true, completion: nil)
    }
    
    //MARK: UICollectionViewDelegate/Datasource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.flightSegments.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FlightDetailCollectionViewCell", forIndexPath: indexPath) as! FlightDetailCollectionViewCell
        cell.segmentNumber = "\(indexPath.row + 1)"
        cell.segmentStrings = self.flightSegments[indexPath.row]
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
    
//    func safariViewControllerDidFinish(controller: SFSafariViewController) {
////        self.dismissViewControllerAnimated(true, completion: nil)
//    }

}

