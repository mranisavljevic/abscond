//
//  abscondTests.swift
//  abscondTests
//
//  Created by Miles Ranisavljevic on 1/29/16.
//  Copyright © 2016 creeperspeak. All rights reserved.
//

import XCTest
@testable import abscond

class abscondTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchFlight() {
        let expectation = expectationWithDescription("Expecting the network call to succeed")
        
        ExpediaAPI.searchFlights("PDX", departureDate: "2016-02-05", returnDate: "2016-02-07") { (success, data) -> () in
            if success {
                expectation.fulfill()
            } else {
                XCTFail("Network call failed!")
            }
        }
        waitForExpectationsWithTimeout(6, handler: nil)
    }
    
    func testRandomAirportGenerator() {
        
        
//        XCTAssert(RandomAirportGenerator.arrivalAirports.count <= 10)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
