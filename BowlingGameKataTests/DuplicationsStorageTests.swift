//
//  DuplicationsStorageTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class DuplicationsStorageTests: XCTestCase {

    func testFindActiveStrike() {
      let storage = DuplicationsStorage()
			storage.addStrike(withRoll: 3)
			
			XCTAssert(storage.countActiveDuplications(onRoll: 4) == 1)
			XCTAssert(storage.countActiveDuplications(onRoll: 5) == 1)
    }
	
	func testFindActiveSpare() {
		let storage = DuplicationsStorage()
		storage.addSpare(withRoll: 3)
		
		XCTAssertEqual(storage.countActiveDuplications(onRoll: 4), 1)
	}
	
	
	func testNoActiveStrike() {
		let storage = DuplicationsStorage()
		storage.addStrike(withRoll: 3)
		
		XCTAssert(storage.countActiveDuplications(onRoll: 3) == 0)
		XCTAssert(storage.countActiveDuplications(onRoll: 6) == 0)
	}
	
	
	func testNoActiveSpares() {
		let storage = DuplicationsStorage()
		storage.addSpare(withRoll: 3)
		
		XCTAssert(storage.countActiveDuplications(onRoll: 3) == 0)
		XCTAssert(storage.countActiveDuplications(onRoll: 5) == 0)
	}
	
	
	
	func testMultiplyStrikes() {
		let storage = DuplicationsStorage()
		storage.addStrike(withRoll: 1)
		storage.addStrike(withRoll: 2)
		storage.addStrike(withRoll: 5)
		
		XCTAssert(storage.countActiveDuplications(onRoll: 1) == 0)
		XCTAssert(storage.countActiveDuplications(onRoll: 2) == 1)
		XCTAssert(storage.countActiveDuplications(onRoll: 3) == 2)
		XCTAssert(storage.countActiveDuplications(onRoll: 4) == 1)
		XCTAssert(storage.countActiveDuplications(onRoll: 6) == 1)
		XCTAssert(storage.countActiveDuplications(onRoll: 8) == 0)
	}
	

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
