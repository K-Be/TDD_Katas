//
//  StrikesStorage.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


class StrikesStorage {
	
	private var strikesList = [Strike]()
	
	func addStrike(withRoll rollIndex: Int) {
		let strike = Strike(startRollIndex: rollIndex)
		strikesList.append(strike)
	}
	
	
	func countActiveStrikes(onRoll rollIndex: Int) -> Int {
		
		let activeStrikes = strikesList.filter { (strike) -> Bool in
			let active = strike.isActive(forRoll: rollIndex)
			return active
		}
		
		return activeStrikes.count
	}
		
}
