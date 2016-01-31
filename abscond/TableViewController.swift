//
//  TableViewController.swift
//  abscond
//
//  Created by William Cremin on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

let kExpediaBlue = UIColor(colorLiteralRed: 0.0/255, green: 53.0/255, blue: 95.0/255, alpha: 1.0)
let kDepartureColor = UIColor(colorLiteralRed: 89.0/255, green: 117.0/255, blue: 139.0/255, alpha: 1.0)
let kReturnColor = UIColor(colorLiteralRed: 149.0/255, green: 194.0/255, blue: 230.0/255, alpha: 1.0)
let kExpediaYellow = UIColor(colorLiteralRed: 255.0/255, green: 210.0/255, blue: 0.0/255, alpha: 1.0)
let kYellowTinted = UIColor(colorLiteralRed: 255.0/255, green: 165.0/255, blue: 0.0/255, alpha: 1.0)
let kRedTinted = UIColor(colorLiteralRed: 255.0/255, green: 132.0/255, blue: 132.0/255, alpha: 1.0)

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var flightOfferResults = [Flight]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.delegate = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        self.tableView.backgroundColor = kExpediaBlue
        self.tableView.separatorColor = kExpediaYellow
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "FlightDetailViewController" {
            if let flight = sender as? Flight, detailVC = segue.destinationViewController as? FlightDetailViewController {
                detailVC.flight = flight
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.flightOfferResults.count// >= 10 ? 10 : self.flightOfferResults.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        cell.flight = self.flightOfferResults[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedFlight = self.flightOfferResults[indexPath.row]
        self.performSegueWithIdentifier("FlightDetailViewController", sender: selectedFlight)
    }
    
    //MARK: UINavigationControllerDelegate
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let vc = viewController as? SearchViewController {
            navigationController.navigationBarHidden = true
        }
    }

}
