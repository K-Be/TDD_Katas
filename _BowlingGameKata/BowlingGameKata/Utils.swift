//
//  Utils.swift
//  BowlingGameKata
//
//  Created by Andrew Romanov on 09.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


func clamp<T:Comparable>(_ val:T, min:T, max:T) -> T {
	guard val >= min else {
		return min
	}
	guard val <= max else {
		return max
	}
	
	return val;
}
