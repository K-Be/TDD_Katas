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

	func enumerateActiveRolls(withBlock block : (Int)->Void) {
		for numberActiveRolls in 1...2 {
			block(numberActiveRolls)
		}
	}
	
	
func testActive() {
	let duplicationIndex = 3
	enumerateActiveRolls { (numberActiveRolls) in
		let dup = Duplication(startRollIndex: duplicationIndex, countRolls: numberActiveRolls)
		
		for i in 1...numberActiveRolls {
			XCTAssertTrue(dup.isActive(forRoll: duplicationIndex + i), "number active rolls = \(numberActiveRolls)")
		}
	}
}

	
func testNotActive() {
	let duplicationIndex = 3
	
	enumerateActiveRolls { (numberActiveRolls) in
		let dup = Duplication(startRollIndex: duplicationIndex, countRolls: numberActiveRolls)
		for i in (numberActiveRolls + 1)...(numberActiveRolls + 1)
		{
			XCTAssertTrue(!dup.isActive(forRoll: duplicationIndex + i), "number active rolls = \(numberActiveRolls)")
		}
	}
}


	
func testNotActiveInPast() {
	let dupIndex = 3
	enumerateActiveRolls { (numberActiveRolls) in
		let dup = Duplication(startRollIndex: dupIndex, countRolls: numberActiveRolls)
		XCTAssertTrue(!dup.isActive(forRoll: 2), "number active rolls = \(numberActiveRolls)")
	}
}


func testNotActiveInCurrentRoll() {
	let dupIndex = 3
	enumerateActiveRolls { (numberActiveRolls) in
		let dup = Duplication(startRollIndex: dupIndex, countRolls: numberActiveRolls)
		XCTAssert(!dup.isActive(forRoll: dupIndex))
	}
}


func testPerformanceExample() {
		// This is an example of a performance test case.
		self.measure {
				// Put the code you want to measure the time of here.
		}
}

}
