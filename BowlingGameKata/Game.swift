//
//  Game.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

public class Game {
	
	public static let countPinsInFrame = Frame.maxCountPins
	public static let maxCountFrames = 10
	
	private(set) var scoreVal = 0
	private(set) var rollIndex = 0
	let strikes = StrikesStorage()
	private(set) var extraRolls = false
	private(set) var frame = Frame(frameIndex: 0)
	
	public func roll(_ pinsCount:Int) {
		if (rollIndex < 20)
		{
			
			let countActiveStrikes = strikes.countActiveStrikes(onRoll: rollIndex)
			scoreVal += (pinsCount + countActiveStrikes * pinsCount)
			if pinsCount == Game.countPinsInFrame
			{
				strikes.addStrike(withRoll: rollIndex)
			}
			
			frame.knock(pinsCount)
			if frame.frameCompleted() {
				frame = Frame(frameIndex: frame.frameIndex + 1)
			}
			
			rollIndex += 1;
		}
		
	}
	
	public func score() -> Int {
		return scoreVal;
	}
	
	
	func isLastFrame() -> Bool {
		return frame.frameIndex == (Game.maxCountFrames - 1);
	}
}

