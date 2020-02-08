//
//  BowlingGameKataTests.swift
//  BowlingGameKataTests
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import BowlingGameKata


class BowlingGameKataTests: XCTestCase {
		
	func testCompile() {
		let _ = self.createGame()
	}
	
	
	func testInitalValue() {
		let game = createGame()
		XCTAssert(game.score() == 0);
	}
	
	
	func testInitilScoreDoesNotChangedWithZeroPins() {
		let game = createGame()
		self.enumerateFrames { (_) in
			game.roll(0);
			XCTAssert(game.score() == 0)
		}
	}
	

	func testNormalFrame() {
		for firstRoll in 0...9 {
			for secondRoll in 0...(9-firstRoll) {
				let game = createGame()
				game.roll(firstRoll);
				XCTAssert(game.score() == firstRoll, "should be \(firstRoll), but is \(game.score())")
				game.roll(secondRoll)
				let sum = firstRoll + secondRoll;
				XCTAssert(game.score() == sum, "should be \(sum), but  is \(game.score())")
			}
		}
	}
	
	
	func testZeroPinsDoesNotChangeScore() {
		
		for firstRoll in 0...9 {
			for secondRoll in 0...(9-firstRoll) {
				let game = createGame()
				game.roll(firstRoll);
				game.roll(secondRoll);
				let score1 = game.score()
				game.roll(0)
				XCTAssert(score1 == game.score(), "\(score1) != \(game.score())")
		}
		}
		
	}
	
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

	func createGame() -> Game {
		return Game()
	}
	
	
	func enumerateFrames(withBlock block: (Int) -> Void) {
		for i in 1...10 {
			block(i)
		}
	}
	
}
