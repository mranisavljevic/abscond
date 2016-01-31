//
//  TableViewController.swift
//  abscond
//
//  Created by William Cremin on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var flightOfferResults = [Flight]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
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

}
