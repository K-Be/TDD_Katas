//
//  Frame.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


struct Frame {
	
	static let maxCountPins = 10
	static let maxRolls = 2
	
	let frameIndex : Int
	private(set) var knockedPinsCount = 0 {
		didSet {
			if self.knockedPinsCount > Frame.maxCountPins {
				self.knockedPinsCount = Frame.maxCountPins
			}
		}
	}
	private(set) var rollsCount = 0;
	
	mutating func knock(_ countPins: Int) {
		guard countPins >= 0 else {
			return
		}
		
		knockedPinsCount += countPins
		rollsCount += 1
	}
	
	
	func frameCompleted() -> Bool {
		return (self.knockedPinsCount == Frame.maxCountPins) || (self.rollsCount >= Frame.maxRolls)
	}
	
}

