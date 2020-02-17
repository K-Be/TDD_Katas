//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation


public class StringCalculator {
	
	public func add(_ numbers: String) -> Int {
		guard !numbers.isEmpty else {
			return 0
		}
		
		let subStrings = numbers.components(separatedBy: CharacterSet(charactersIn: ",\n") )
		let sum : Int =  subStrings.reduce(0) { (pRes, strVal) -> Int in
			return pRes + (Int(strVal) ?? 0)
		}
		return sum
	}
}

