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
		
		let subStrings = numbers.components(separatedBy: CharacterSet(charactersIn: ",") )
		if (subStrings.count == 0) {
			return 0
		}
		else if (subStrings.count == 1){
			return  Int(subStrings.first!) ?? 0
		}
		
		let num1 = Int(subStrings.first!) ?? 0
		let num2 = Int(subStrings[1]) ?? 0
		return num1 + num2
	}
}

