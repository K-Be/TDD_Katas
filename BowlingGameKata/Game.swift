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
	let strikes = DuplicationsStorage()
	private(set) var extraRollsCount = 0
	private(set) var frame = Frame(frameIndex: 0)
	
	public func roll(_ pins:Int) {
		let pinsCount = clamp(pins, min: 0, max: Game.countPinsInFrame - frame.knockedPinsCount)
		if (frame.frameIndex < Game.maxCountFrames || extraRollsCount > 0)
		{
			if (extraRollsCount > 0)
			{
				extraRollsCount -= 1
			}
			
			let countActiveStrikes = strikes.countActiveDuplications(onRoll: rollIndex)
			scoreVal += (pinsCount + countActiveStrikes * pinsCount)
			
			frame.knock(pinsCount)
			switch frame.completionStatus() {
			case .General:
				break;
			case .NotCompleted:
				break;
			case .Spare:
				strikes.addSpare(withRoll: rollIndex)
			case .Strike:
				strikes.addStrike(withRoll: rollIndex)
			}
			if frame.frameCompleted() {
				let shouldExtraRolls = isLastFrame() && (strikes.countActiveDuplications(onRoll: rollIndex + 1) != 0);
				frame = Frame(frameIndex: frame.frameIndex + 1)
				if (shouldExtraRolls)
				{
					if (strikes.countActiveDuplications(onRoll: rollIndex + 2) != 0)
					{
						extraRollsCount = 2
					}
					else
					{
						extraRollsCount = 1
					}
				}
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

