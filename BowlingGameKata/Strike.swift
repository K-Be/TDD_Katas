//
//  Strike.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 08.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


struct Strike {
	let startRollIndex : Int
	
	func isActive(forRoll roll : Int) -> Bool {
		let active = (roll > startRollIndex) && (roll - startRollIndex) <= 2 
		return active
	}
}

