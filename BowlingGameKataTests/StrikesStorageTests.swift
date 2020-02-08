//
//  StrikesStorageTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class StrikesStorageTests: XCTestCase {

    func testFindActiveStrike() {
      let storage = StrikesStorage()
			storage.addStrike(withRoll: 3)
			
			XCTAssert(storage.countActiveStrikes(onRoll: 4) == 1)
			XCTAssert(storage.countActiveStrikes(onRoll: 5) == 1)
    }
	
	
	func testNoActiveStrike() {
		let storage = StrikesStorage()
		storage.addStrike(withRoll: 3)
		
		XCTAssert(storage.countActiveStrikes(onRoll: 3) == 0)
		XCTAssert(storage.countActiveStrikes(onRoll: 6) == 0)
	}
	

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
