//
//  Duplication.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 09.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


struct Duplication {
	
	let startRollIndex : Int
	let countRolls : Int
	
	func isActive(forRoll roll : Int) -> Bool {
		let active = (roll > startRollIndex) && (roll - startRollIndex) <= countRolls
		return active
	}
	
}
