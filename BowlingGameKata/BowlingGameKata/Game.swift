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
	let duplications = DuplicationsStorage()
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
			
			insreaseScore(withPinsCount:pinsCount)
			
			frame.knock(pinsCount)
			tryAddDuplicationsForCurrentFrame()
			
			if frame.frameCompleted() {
				let shouldExtraRolls = isLastFrame() && (duplications.countActiveDuplications(onRoll: rollIndex + 1) != 0);
				frame = Frame(frameIndex: frame.frameIndex + 1)
				if (shouldExtraRolls)
				{
					addExtraRolls()
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
	
	func isExtraRollsGame() -> Bool {
		return frame.frameIndex >= Game.maxCountFrames
	}
	
	
	fileprivate func tryAddDuplicationsForCurrentFrame() {
		switch frame.completionStatus() {
		case .General:
			break;
		case .NotCompleted:
			break;
		case .Spare:
			if (!self.isExtraRollsGame())
			{
				duplications.addSpare(withRoll: rollIndex)
			}
		case .Strike:
			if (!self.isExtraRollsGame())
			{
				duplications.addStrike(withRoll: rollIndex)
			}
		}
	}
	
	
	fileprivate func addExtraRolls() {
		if (duplications.countActiveDuplications(onRoll: rollIndex + 2) != 0)
		{
			extraRollsCount = 2
		}
		else
		{
			extraRollsCount = 1
		}
	}
	
	
	fileprivate func insreaseScore(withPinsCount pinsCount: Int) {
		if (!self.isExtraRollsGame())
		{
			scoreVal += pinsCount
		}
		let countActiveDuplications = duplications.countActiveDuplications(onRoll: rollIndex)
		scoreVal += countActiveDuplications * pinsCount
	}
	
}

