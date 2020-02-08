//
//  Game.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

public class Game {
	
	var scoreVal = 0
	var rollIndex = 0
	
	public func roll(_ pinsCount:Int) {
		if (rollIndex < 20)
		{
			scoreVal += pinsCount
			rollIndex += 1;
		}
		
	}
	
	public func score() -> Int {
		return scoreVal;
	}
}

