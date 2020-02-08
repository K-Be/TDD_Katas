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
	
	var scoreVal = 0
	var rollIndex = 0
	let strikes = StrikesStorage()
	var extraRolls = false
	
	public func roll(_ pinsCount:Int) {
		if (rollIndex < 20)
		{
			
			let countActiveStrikes = strikes.countActiveStrikes(onRoll: rollIndex)
			scoreVal += (pinsCount + countActiveStrikes * pinsCount)
			if pinsCount == Game.countPinsInFrame
			{
				strikes.addStrike(withRoll: rollIndex)
			}
			
			rollIndex += 1;
		}
		
	}
	
	public func score() -> Int {
		return scoreVal;
	}
}

