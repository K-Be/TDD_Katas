//
//  DuplicationTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 09.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class DuplicationTests: XCTestCase {

func testActive() {
	let duplicationIndex = 3
	let numberActiveRolls = 2
	
	let dup = Duplication(startRollIndex: duplicationIndex, countRolls: numberActiveRolls)
	
	for i in 1...numberActiveRolls {
		XCTAssertTrue(dup.isActive(forRoll: duplicationIndex + i))
	}
}

func testNotActive() {
	let duplicationIndex = 3
	let numberActiveRolls = 2
	
	let dup = Duplication(startRollIndex: duplicationIndex, countRolls: numberActiveRolls)
	for i in (numberActiveRolls + 1)...(numberActiveRolls + 1)
	{
		XCTAssertTrue(!dup.isActive(forRoll: duplicationIndex + i))
	}
}


func testNotActiveInPast() {
	let dupIndex = 3
	let dup = Duplication(startRollIndex: dupIndex, countRolls: 1)
	XCTAssertTrue(!dup.isActive(forRoll: 2))
}


func testNotActiveInCurrentRoll() {
	let dupIndex = 3
	let dup = Duplication(startRollIndex: dupIndex, countRolls: 1)
	XCTAssert(!dup.isActive(forRoll: dupIndex))
}


func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
				// Put the code you want to measure the time of here.
		}
}

}
