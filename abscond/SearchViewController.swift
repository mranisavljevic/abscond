//
//  SearchViewController.swift
//  abscond
//
//  Created by William Cremin on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var airports = ["ABR","ABI","CAK","ALS","ABY","ALB","ABQ","AEX","ABE", "AIA","APN","AOO","AMA","ANC","ATW","AVL","ASE","AHN", "ATL","ACY","AGS","AUG","AUS","BFL","BWI","BGR","BHB", "BRW","BTR","BPT","BKW","BED","BLI","BJI","BET","BTT", "BIL","BGM","BHM","BIS","BMI","BMG","BLF","BOI","BOS", "BZN","BKX","BRO","BQK","BUF","BUR","BRL","BBF","BTV", "BTM","CGI","CLD","CNM","CPR","CID","CMI","CHS","CRW", "CLT","CHO","CHA","CYS","CHI","MDW","CHI","ORD","CIC", "CVG","CKB","CLE","CVN","COD","CLL","COS","COU","CAE", "CSG","CLU","GTR","OLU","CMH","CDV","CRP","DAL","DFW", "DAY","DAB","DEC","DEN","DSM","DTW","DTT","DVL","DIK", "DLG","DDC","DHN","DUJ","DBQ","DLH","DRO","DUT","EAU", "EEK","IPL","ELD","ELP","EKO","ELM","WDG","ERI","ESC", "EUG","ACV","EVV","FAI","FAR","FMN","XNA","FAY","FLG", "FNT","FLO","FOD","FLL","TBN","RSW","FSM","VPS","FWA", "FYU","FAT","GNV","GCK","GCC","GDV","GFK","GRI","GJT", "GRR","GBD","GTF","GRB","LWB","GSO","GLH","PGV","GSP", "GPT","GUC","HGR","HNM","CMX","HRL","MDT","HRO","BDL", "HVR","HYS","HLN","HIB","Big","HHH","HOB","HOM","HNL", "MKK","EFD","HOU","IAH","EFD","HTS","HSV","HON","HYA", "IDA","IND","INL","IYK","IMT","IWD","ISP","ITH","JAC", "JAN","MKL","JAX","OAJ","JMS","JHW","JST","JPR","JLN", "JNU","OGG","AZO","LUP","FCA","MCI","JHM","EAR","ENA", "KTM","EYW","GRK","AKN","IGM","IRK","LMT","TYS","ADQ", "LSE","LFT","LCH","Hll","LNY","LNS","LAN","LAR","LRD", "LRU","LAS","LBE","PIB","LAW","LAB","LWS","LEW","LWT", "LEX","LBL","LIH","LNK","LIT","LGB","GGG","QLA","SDF", "LBB","LYH","MCN","MSN","MHT","MHK","MBL","MWA","MQT", "MVY","MCW","MSS","MFE","MCK","MFR","MLB","MEM","MEI", "MIA","MAF","MLS","MKE","MSP","MOT","MSO","MOB","MOD", "MLI","MLU","MRY","MGM","MTJ","MGW","MWH","MSL","MKG", "MRY","ACK","ABF","BNA","EWN","HVN","MSY","LGA","JFK", "NYC","EWR","SWF","PHF","OME","ORF","OTH","LBF","OAK", "OGS","OKC","OMA","ONT","SNA","MCO","OSH","OWB","OXR", "PAH","PGA","PSP","PFN","PKB","PSC","PLN","PDT","PNS", "PIA","PHL","PHX","PIR","SOP","PIT","PIH","PNC","PWM", "PDX","PSM","PRC","PQI","PVD","PVC","PUB","PUW","UIN", "RDU","RAP","RDD","RDM","RNO","RHI","RIC","RIW","ROA", "RST","ROC","RKS","RFD","RKD","ROW","RUT","SMF","MBS", "SLN","SPY","SLC","SJT","SAT","SAN","QSF","SFO","SJC", "SBP","SDP","SBA","SAF","SMX","STS","SLK","SRQ","CIU", "SAV","BFF","SEA","SHD","SHR","SHV","SDY","SVC","SUX", "FSD","SIT","SGY","SBN","GEG","SPI","CEF","SGF","VSF", "STC","SGU","STL","PIE","SCE","SBS","SUN","SRY","TLH", "TPA","TAX","TXK","TVF","OOK","TOL","TOP","TVC","TTN", "TUS","TUL","TUP","TWF","TYR","UNK","EGE","VDZ","VLD", "VCT","VIS","ACT","ALW","DCA","WAS","IAD","ALO","ART", "ATY","CWA","EAT","PBI","WYS","HPN","SPS","ICT","AVP", "IPT","ISN","ILG","ILM","OLF","WRL","WRG","YKM","YAK", "YUM","YXX","YAA","YEK","YBG","YYC","YBL","YGR","YCG", "YYG","YMT","YYQ","YXC","YDF","YHD","YEG","YEO","YMM", "YYE","YXJ","YSM","YFC","YQX","YGP","YQU","YHZ","YHM", "YFB","YKA","YLW","YQK","YGK","YQL","YXU","YXH","YQM", "YYY","YMQ","YUL","YCD","YYB","YOW","YYF","YZT","YPW", "YPR","YQB","YQZ","YRT","YRL","YQR","YRJ","YUY","YSJ", "YZP","YZR","YXE","YAM","YZV","YXL","YYD","YYT","YSB", "YQY","YXT","YTH","YQT","YTS","YYZ","YTO","YTZ","YVO", "YVR","YYJ","YWK","YXY","YWL","YQG","YWG","YZF","LAX"]
    
    var tenRandomAirports = [String]()
    
    var flightOfferResults = [Flight]()
    
    var nextWeekendDates = (start: "", end: "")
    
    var isSearching = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchingLabel: UILabel!
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getNextWeekendDates()
        self.setupCollectionView()
        self.spinner.hidesWhenStopped = true
        self.spinner.color = UIColor(colorLiteralRed: 0.0, green: 53.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = kExpediaBlue
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.isSearching = false
        self.searchingLabel.hidden = true
    }
    
    override func viewDidLayoutSubviews() {
        self.isSearching = true
        self.collectionView.scrollToItemAtIndexPath(NSIndexPath(forRow: 1000, inSection: 0), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: false)
        self.isSearching = false
        self.searchingLabel.hidden = true
    }
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        layout.minimumInteritemSpacing = 0.0
        self.collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        self.collectionView.collectionViewLayout = layout
        self.collectionView.backgroundColor = UIColor(colorLiteralRed: 51.0/255, green: 103.0/255, blue: 153.0/255, alpha: 1.0)
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    func getNextWeekendDates() {
        let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        var dayInterval = (start: 0, end: 0)
        let todayFormatter = NSDateFormatter()
        todayFormatter.dateFormat = "EEEE"
        let today = todayFormatter.stringFromDate(NSDate())
        switch today {
        case days[0]:
            dayInterval.start = 4
            dayInterval.end = 6
        case days[1]:
            dayInterval.start = 3
            dayInterval.end = 5
        case days[2]:
            dayInterval.start = 2
            dayInterval.end = 4
        case days[3]:
            dayInterval.start = 1
            dayInterval.end = 3
        case days[4]:
            dayInterval.start = 1
            dayInterval.end = 2
        case days[5]:
            dayInterval.start = 6
            dayInterval.end = 8
        case days[6]:
            dayInterval.start = 5
            dayInterval.end = 7
        default: break
        }
        let secondsToStart = Double(dayInterval.start * 60 * 60 * 24)
        let nextWeekendStart = NSDate().dateByAddingTimeInterval(secondsToStart)
        
        let secondsToEnd = Double(dayInterval.end * 60 * 60 * 24)
        let nextWeekendEnd = NSDate().dateByAddingTimeInterval(secondsToEnd)
        
        let weekendFormatter = NSDateFormatter()
        weekendFormatter.dateFormat = "yyyy-MM-dd"
        let nextWeekendStartFormatted = weekendFormatter.stringFromDate(nextWeekendStart)
        let nextWeekendEndFormatted = weekendFormatter.stringFromDate(nextWeekendEnd)
        
        self.nextWeekendDates.start = nextWeekendStartFormatted
        self.nextWeekendDates.end = nextWeekendEndFormatted
    }
    
//    func getInfoForTenAirports() {
////        NSOperationQueue().addOperationWithBlock { () -> Void in
////            var isDone = false
//            var completionCounter: Int = 0 {
//                didSet {
////                    print(completionCounter)
////                    if completionCounter >= 10 && !isDone {
////                        isDone = true
////                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
////                            self.performSegueWithIdentifier("TableViewController", sender: self)
////                        })
////                    }
//                    print("\(completionCounter) completed")
//                }
//            }
//            var flightOffersTemp = [Flight]()
//            var searchCounter = 0
//            for i in 0...9 {
//                print("Call: \(i)")
////            while completionCounter < 10 {
//                if searchCounter < 10 {
//                    print("Searching: \(self.tenRandomAirports[searchCounter])")
//                    ExpediaAPI.searchFlights(self.tenRandomAirports[searchCounter++], departureDate: self.nextWeekendDates.start, returnDate: self.nextWeekendDates.end, completion: { (success, data) -> () in
//                        if success {
//                            if let result = data {
//                                if let offers = JSONService.parseFlightSearchJSON(result) {
//                                    let sortedOffers = offers.sort({ (a, b) -> Bool in
//                                        if let priceA = Double(a.formattedPrice.substringFromIndex(a.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), priceB = Double(b.formattedPrice.substringFromIndex(b.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
//                                            return priceA < priceB
//                                        } else {
//                                            return a.formattedPrice < b.formattedPrice
//                                        }
//                                    })
//                                    if sortedOffers.count >= 2 {
//                                        print("Adding: \(sortedOffers[0].formattedPrice) & \(sortedOffers[1].formattedPrice)")
//                                        flightOffersTemp.append(sortedOffers[0])
//                                        flightOffersTemp.append(sortedOffers[1])
//                                        completionCounter++
//                                    } else {
//                                        completionCounter++
//                                    }
//                                } else {
//                                    completionCounter++
//                                }
//                            } else {
//                                completionCounter++
//                            }
//                        }
//                    })
//                }
////            }
//            }
//            let finishDate = NSDate()
//            while completionCounter < 10 && NSDate().timeIntervalSinceDate(finishDate) < 5.0 {
////                print("While loop")
//            }
//            let fullSortedList = flightOffersTemp.sort({ (flightA, flightB) -> Bool in
//                if let a = Double(flightA.formattedPrice.substringFromIndex(flightA.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), b = Double(flightB.formattedPrice.substringFromIndex(flightB.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
//                    return a < b
//                } else {
//                    return flightA.formattedPrice < flightB.formattedPrice
//                }
//            })
//            self.flightOfferResults = fullSortedList
//            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
//                self.performSegueWithIdentifier("TableViewController", sender: self)
//            })
//            
////            for i in 0...9 {
////                print("Searching \(self.tenRandomAirports[i])")
////                ExpediaAPI.searchFlights(self.tenRandomAirports[i], departureDate: self.nextWeekendDates.start, returnDate: self.nextWeekendDates.end, completion: { (success, data) -> () in
////                    if success {
////                        if let data = data {
////                            if let  flightOffers = JSONService.parseFlightSearchJSON(data) {
////                                self.flightOfferResults = flightOffers
////                                let sorted = flightOffers.sort({ (a, b) -> Bool in
////                                    if let priceA = Double(a.formattedPrice.substringFromIndex(a.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), priceB = Double(b.formattedPrice.substringFromIndex(b.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
////                                        return priceA < priceB
////                                    }
////                                    return a.formattedPrice < b.formattedPrice
////                                })
////                                if sorted.count >= 2 {
////                                    print("Adding \(self.tenRandomAirports[i]): \(sorted[0].formattedPrice) & \(sorted[1].formattedPrice)")
////                                    flightOffersTemp.append(sorted[0])
////                                    flightOffersTemp.append(sorted[1])
////                                    completionCounter = completionCounter == 9 ? completionCounter : completionCounter + 1
////                                }
////                                print("Index being searched: \(i)")
////                                if completionCounter >= 10 {
////                                    let sortedOffers = flightOffersTemp.sort({ (flightA, flightB) -> Bool in
////                                        let priceA = Double(flightA.formattedPrice.substringFromIndex(flightA.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: ""))
////                                        let priceB = Double(flightB.formattedPrice.substringFromIndex(flightB.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: ""))
////                                        guard let a = priceA, b = priceB else {
////                                            return flightA.formattedPrice < flightB.formattedPrice
////                                        }
////                                        return a < b
////                                    })
////                                    self.flightOfferResults = sortedOffers
////                                    completionCounter++
////                                }
////                            }
////                        } else {
////                            print("No data returned for airport: \(self.tenRandomAirports[i])")
////                            completionCounter++
////                        }
////                    } else {
////                        print("error")
////                        completionCounter++
////                    }
////                })
////            }
////        }
//    }
    
    let queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
    
    func getInfoForTenAirportsCopy(index: Int, completion:(flights: [Flight]?)->()) {
        dispatch_async(queue) { () -> Void in
            var flightOffersTemp = [Flight]()
            print("Searching: \(self.tenRandomAirports[index])")
            ExpediaAPI.searchFlights(self.tenRandomAirports[index], departureDate: self.nextWeekendDates.start, returnDate: self.nextWeekendDates.end, completion: { (success, data) -> () in
                if success {
                    if let result = data {
                        if let offers = JSONService.parseFlightSearchJSON(result) {
                            let sortedOffers = offers.sort({ (a, b) -> Bool in
                                if let priceA = Double(a.formattedPrice.substringFromIndex(a.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), priceB = Double(b.formattedPrice.substringFromIndex(b.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
                                    return priceA < priceB
                                } else {
                                    return a.formattedPrice < b.formattedPrice
                                }
                            })
                            if sortedOffers.count >= 2 {
                                print("Adding: \(sortedOffers[0].formattedPrice) & \(sortedOffers[1].formattedPrice)")
                                flightOffersTemp.append(sortedOffers[0])
                                flightOffersTemp.append(sortedOffers[1])
                                completion(flights: flightOffersTemp)
                            } else {
                                completion(flights: nil)
                            }
                        } else {
                            completion(flights: nil)
                        }
                    } else {
                        completion(flights: nil)
                    }
                } else {
                    completion(flights: nil)
                }
            })
        }
//        NSOperationQueue().addOperationWithBlock { () -> Void in
//            var flightOffersTemp = [Flight]()
//                print("Call: \(index)")
//                print("Searching: \(self.tenRandomAirports[index])")
//                ExpediaAPI.searchFlights(self.tenRandomAirports[index], departureDate: self.nextWeekendDates.start, returnDate: self.nextWeekendDates.end, completion: { (success, data) -> () in
//                        if success {
//                            if let result = data {
//                                if let offers = JSONService.parseFlightSearchJSON(result) {
//                                    let sortedOffers = offers.sort({ (a, b) -> Bool in
//                                        if let priceA = Double(a.formattedPrice.substringFromIndex(a.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), priceB = Double(b.formattedPrice.substringFromIndex(b.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
//                                            return priceA < priceB
//                                        } else {
//                                            return a.formattedPrice < b.formattedPrice
//                                        }
//                                    })
//                                    if sortedOffers.count >= 2 {
//                                        print("Adding: \(sortedOffers[0].formattedPrice) & \(sortedOffers[1].formattedPrice)")
//                                        flightOffersTemp.append(sortedOffers[0])
//                                        flightOffersTemp.append(sortedOffers[1])
//                                        completion(flights: flightOffersTemp)
//                                    } else {
//                                        completion(flights: nil)
//                                    }
//                                } else {
//                                    completion(flights: nil)
//                                }
//                            } else {
//                                completion(flights: nil)
//                            }
//                        }
//                    })
//                }
            }

    
//    @IBAction func searchButtonPressed(sender: UIButton) {
//        
//        let searchAirports = RandomAirportGenerator.tenRandomAirports(airports)
//        airports = searchAirports.1
//        tenRandomAirports = searchAirports.0
//        for i in 0...9 {
//            self.getInfoForTenAirportsCopy(i, completion: { (flights) -> () in
//                if let results = flights {
//                    self.flightOfferResults.appendContentsOf(results)
//                }
//                if i >= 9 {
//                    self.sortAllResults()
//                }
//            })
//        }
////        getInfoForTenAirports()
//
//    }
    
    func sortAllResults() {
        let sorted = self.flightOfferResults.sort { (flightA, flightB) -> Bool in
            if let a = Double(flightA.formattedPrice.substringFromIndex(flightA.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")), b = Double(flightB.formattedPrice.substringFromIndex(flightB.formattedPrice.startIndex.advancedBy(1)).stringByReplacingOccurrencesOfString(",", withString: "")) {
                return a < b
            } else {
                return flightA.formattedPrice < flightB.formattedPrice
            }
        }
        self.flightOfferResults = sorted
        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
            self.isSearching = false
            self.completionCounter = 0
            self.spinner.stopAnimating()
            self.performSegueWithIdentifier("TableViewController", sender: self)
        })
    }


//  MARK: Prepare for segue

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TableViewController" {
            if let tableViewController = segue.destinationViewController as? TableViewController {
                tableViewController.flightOfferResults = self.flightOfferResults
            }
        }
    }
    
//  MARK: Collection View Data Source
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2000
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Map", forIndexPath: indexPath)
        let mapImage = UIImageView(image: UIImage(named: "map.png"))
        mapImage.frame.size = cell.frame.size
        mapImage.contentMode = .ScaleAspectFill
        cell.addSubview(mapImage)
        return cell
    }
    
    
//  MARK: Collection View Delegate Flow Layout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.height * (1020/600), height: self.collectionView.frame.size.height)
    }
    
//  MARK: Scroll View Delegate
    var completionCounter = 0 {
        didSet {
            if completionCounter > 0 {
                print("Just completed search #\(completionCounter)")
            }
        }
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.searchingLabel.hidden = false
        self.fetchResults()
    }
    
    
    func fetchResults() {
        if !self.isSearching {
            self.isSearching = true
            self.spinner.startAnimating()
            let searchAirports = RandomAirportGenerator.tenRandomAirports(airports)
            airports = searchAirports.1
            tenRandomAirports = searchAirports.0
            for i in 0...9 {
                self.getInfoForTenAirportsCopy(i, completion: { (flights) -> () in
                    if let results = flights {
                        self.flightOfferResults.appendContentsOf(results)
                    }
                    if self.completionCounter++ == 9 {
                        self.sortAllResults()
                    }
                })
            }
        }
    }
    
    
}
