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
		for firstRoll in 0...(Game.countPinsInFrame - 1) {
			for secondRoll in 0...(Game.countPinsInFrame - 1 - firstRoll) {
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
		
		for firstRoll in 0...(Game.countPinsInFrame - 1) {
			for secondRoll in 0...(Game.countPinsInFrame - 1 - firstRoll) {
				let game = createGame()
				game.roll(firstRoll);
				game.roll(secondRoll);
				let score1 = game.score()
				game.roll(0)
				XCTAssert(score1 == game.score(), "\(score1) != \(game.score())")
		}
		}
	}
	
	
	func testGameWithNormalFramesChangesOnly20Times() {
		
		let game = createGame()
		
		let countPinsInRoll = 2
		for _ in 1...(Game.maxCountFrames * 2 + 1)  {
			game.roll(countPinsInRoll);
		}
		
		XCTAssert(game.score() == 20 * countPinsInRoll, "gameScore == \(game.score()), but should be \(20 * countPinsInRoll)")
	}
	
	
	func testStrikeScores() {
		
		let game = createGame()
		
		//strike
		game.roll(10)
		
		let inFirstRoll = 3
		game.roll(3)
		let inSecondRoll = 5
		game.roll(inSecondRoll)
		
		XCTAssert(game.score() == 10 + 2 * inFirstRoll + 2 * inSecondRoll)
	}
	
	
	func testStrikeOffAfterTwoSteps() {
		
		let game = createGame()
		
		game.roll(10)
		
		let inFirstRoll = 3
		game.roll(3)
		let inSecondRoll = 5
		game.roll(inSecondRoll)
		
		let inThird = 1
		game.roll(inThird)
		
		XCTAssert(game.score() == 10 + 2 * inFirstRoll + 2 * inSecondRoll + inThird)
		
	}
	
	
	func testSumDoubleStrikes() {
		let game = createGame()
		
		game.roll(Game.countPinsInFrame)
		game.roll(Game.countPinsInFrame)
		//now we have 2 active strikes
		
		let pinsInRollThree = 4
		game.roll(pinsInRollThree)
		
		XCTAssert(game.score() == Game.countPinsInFrame + Game.countPinsInFrame * 2 + pinsInRollThree * 3, "score = \(game.score()) but should be \(Game.countPinsInFrame + Game.countPinsInFrame * 2 + pinsInRollThree * 3)")
	}
	
	
	func testSumAfterLastStrike() {
		
		let game = createGame()
		
		for _ in 1...(2 * Game.maxCountFrames - 2) {
			game.roll(0);
		}
		
		//last frame
		game.roll(Game.countPinsInFrame)
		let countInRoll = 1
		game.roll(countInRoll)
		game.roll(countInRoll)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame + countInRoll * 2 + countInRoll * 2)
	}
	
	
	func testNotSumAfterEndOfGameAfterOfLastStrike() {
		
		let game = createGame()
		
		for _ in 1...(2 * Game.maxCountFrames - 2) {
			game.roll(0);
		}
		
		//last frame
		game.roll(Game.countPinsInFrame)
		let countInRoll = 1
		game.roll(countInRoll)
		game.roll(countInRoll)
		
		//shouldn't calculate
		game.roll(countInRoll)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame + countInRoll * 2 + countInRoll * 2)
	}
	
	
	func testDetectLastFrame() {
		let game = createGame()
		
		for _ in 1...(Game.maxCountFrames - 1) {
			game.roll(Game.countPinsInFrame)
		}
		
		XCTAssertTrue(game.isLastFrame());
	}
	
	
	func testDetectLastFrameInNormalGame() {
		
		let game = createGame()
		for _ in 1...(2 * Game.maxCountFrames - 2) {
			game.roll(0)
		}
		
		XCTAssertTrue(game.isLastFrame())
	}
	
	
	func testNonLastFrame() {
		let game = createGame()
		
		game.roll(4);
		
		XCTAssertFalse(game.isLastFrame());
	}
	
	
	func testSpare() {
		let game = createGame()
		
		let knockedOnFirstRoll = 2
		game.roll(knockedOnFirstRoll)
		game.roll(Game.countPinsInFrame - knockedOnFirstRoll)
		//here we have Spare
		
		game.roll(1)
		game.roll(1)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame + 1 * 2 + 1);
	}
	
	
	func testSpareOnLastFrame() {
		let game = createGame()
		
		for _ in 1...(2 * Game.maxCountFrames - 2) {
			game.roll(0);
		}
		
		//last frame
		game.roll(1)
		game.roll(Game.countPinsInFrame - 1)
		let countInRoll = 1
		game.roll(countInRoll)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame + countInRoll * 2)
	}
	
	
	func testDoubleOnceAfterLastSpare() {
		let game = createGame()
		
		for _ in 1...(2 * Game.maxCountFrames - 2) {
			game.roll(0);
		}
		
		//last frame
		game.roll(1)
		game.roll(Game.countPinsInFrame - 1)
		let countInRoll = 1
		game.roll(countInRoll)
		
		//after end of the game
		game.roll(countInRoll)
		
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame + countInRoll * 2)
	}
	
	
	func testGreaterThenInOneFrame() {
		let game = Game()
		
		let count = 5
		game.roll(count)
		game.roll(Game.countPinsInFrame)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame)
	}
	
	
	func testGreatethemMaxInFrameWithStrike() {
		let game = Game()
		
		game.roll(Game.countPinsInFrame)
		
		XCTAssertEqual(game.score(), Game.countPinsInFrame)
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
