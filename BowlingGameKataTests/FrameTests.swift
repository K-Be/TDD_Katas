//
//  FrameTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class FrameTests: XCTestCase {


	func testInital() {
		let frame = Frame(frameIndex: 10)
		
		XCTAssertEqual(frame.knockedPinsCount, 0)
	}
	
	
	func testKnock() {
		var frame = Frame(frameIndex: 10)
		
		frame.knock(1)
		frame.knock(2)
		
		XCTAssertEqual(frame.knockedPinsCount, 3)
	}
	
	
	func testOverKnock() {
		var frame = Frame(frameIndex: 10);
		
		frame.knock(Frame.maxCountPins + 1);
		
		XCTAssertEqual(frame.knockedPinsCount, Frame.maxCountPins)
	}
	
	
	func testNegativeKnocks() {
		var frame = Frame(frameIndex: 10)
		
		frame.knock(-3)
		
		XCTAssertEqual(frame.knockedPinsCount, 0)
	}
	
	
	func testInitialFrameNotCompleted() {
		let frame = Frame(frameIndex: 10)
		
		XCTAssertFalse(frame.frameCompleted())
	}
	
	
	func testFrameCompleted() {
		var frame = Frame(frameIndex: 10)
		
		frame.knock(Frame.maxCountPins)
		
		XCTAssertTrue(frame.frameCompleted())
	}
	
	
	

	func testPerformanceExample() {
			// This is an example of a performance test case.
			self.measure {
					// Put the code you want to measure the time of here.
			}
	}

}
