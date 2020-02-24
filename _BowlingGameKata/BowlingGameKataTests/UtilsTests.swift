//
//  UtilsTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 09.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata

class UtilsTests: XCTestCase {

    func testClampLessMin() {
			XCTAssertEqual(clamp(0, min: 1, max: 2), 1)
    }
	
	func testInInterval() {
		XCTAssertEqual(clamp(1, min: 0, max: 2), 1)
	}
	
	func testGreateMax() {
		XCTAssertEqual(clamp(4, min: 1, max: 3), 3)
	}
	

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
