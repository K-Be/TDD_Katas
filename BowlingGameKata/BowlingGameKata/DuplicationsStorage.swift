//
//  DuplicationsStorage.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


class DuplicationsStorage {
	
	private var duplicationsList = [Duplication]()
	
	func addStrike(withRoll rollIndex: Int) {
		let strike = Duplication(startRollIndex: rollIndex, countRolls: 2)
		duplicationsList.append(strike)
	}
	
	
	func addSpare(withRoll rollIndex: Int) {
		let spare = Duplication(startRollIndex: rollIndex, countRolls: 1)
		duplicationsList.append(spare)
	}
	
	
	func countActiveDuplications(onRoll rollIndex: Int) -> Int {
		
		let activeStrikes = duplicationsList.filter { (strike) -> Bool in
			let active = strike.isActive(forRoll: rollIndex)
			return active
		}
		
		return activeStrikes.count
	}
		
}
