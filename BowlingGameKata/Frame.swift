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
	
	let frameIndex : Int
	private(set) var knockedPinsCount = 0
	
	mutating func knock(_ countPins: Int) {
		
	}
	
	
	func frameCompleted() -> Bool {
		return false
	}
	
}

