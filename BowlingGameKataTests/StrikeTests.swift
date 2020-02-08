//
//  StrikeTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class StrikeTests: XCTestCase {

    func testActive() {
			let strikeIndex = 3
      let strike = Strike(startRollIndex: strikeIndex)
			XCTAssert(strike.isActive(forRoll: strikeIndex + 1))
			XCTAssert(strike.isActive(forRoll: strikeIndex + 2))
    }
	
	func testNotActive() {
		let strikeIndex = 3
		let strike = Strike(startRollIndex: strikeIndex)
		XCTAssert(!strike.isActive(forRoll: strikeIndex + 3))
	}

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
