//
//  Game.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

public class Game {
	
	public static let countPinsInFrame = 10
	
	var scoreVal = 0
	var rollIndex = 0
	var strikeFrameIndex : Int?
	
	
	public func roll(_ pinsCount:Int) {
		if (rollIndex < 20)
		{
			scoreVal += pinsCount
			if let strikeFrameIndex = strikeFrameIndex {
				scoreVal += pinsCount
				
				let strikeRollIndex = strikeFrameIndex * 2
				if rollIndex - strikeRollIndex >= 2 {
					self.strikeFrameIndex = nil
				}
			}
			if pinsCount == Game.countPinsInFrame
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

