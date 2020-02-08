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
	
	

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

	func createGame() -> Game {
		return Game()
	}
	
}
