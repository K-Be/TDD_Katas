//
//  Game.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

public class Game {
	
	let countPinsInFrame = 10
	
	var scoreVal = 0
	var rollIndex = 0
	var strikeFrameIndex : Int?
	
	
	public func roll(_ pinsCount:Int) {
		if (rollIndex < 20)
		{
			scoreVal += pinsCount
			if strikeFrameIndex != nil {
				scoreVal += pinsCount
			}
			if pinsCount == countPinsInFrame
			{
				strikeFrameIndex = rollIndex / 2
			}
			
			rollIndex += 1;
		}
		
	}
	
	public func score() -> Int {
		return scoreVal;
	}
}

