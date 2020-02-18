//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

//https://osherove.com/tdd-kata-1/
//on task 4
public class StringCalculator {
	
	public func add(_ numbers: String) -> Int {
		guard !numbers.isEmpty else {
			return 0
		}
		
		
		var subStrings = Array<String>()
		if let delimeter = Delimeter(withString:numbers) {
			let substringView = numbers[delimeter.delimeterDescriptionRange.upperBound...];
			subStrings = substringView.components(separatedBy: delimeter.toString);
		}
		else {
			subStrings = numbers.components(separatedBy: CharacterSet(charactersIn: ",\n") )
		}
		let sum : Int =  subStrings.reduce(0) { (pRes, strVal) -> Int in
			return pRes + (Int(strVal) ?? 0)
		}
		return sum
	}
	
	
	func delimeter(forString str: String) -> String? {
		return nil

		
	}
	
	
}

