//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

//https://osherove.com/tdd-kata-1/
//on task 6
public class StringCalculator {
	
	let maxNum : Int
	public init (maxNum: Int = Int.max) {
		self.maxNum = maxNum;
	}
	
	public enum Exception : Error {
		case negativeNumbers(numbers: [Int]);
	}
		
	public func add(_ numbers: String) throws -> Int {
		guard !numbers.isEmpty else {
			return 0
		}
		var numPairs = Array<NumbersParser.NumPair>()
		if let delimeter = Delimeter(withString:numbers) {
			let substringView = numbers[delimeter.delimeterDescriptionRange.upperBound...];
			let parser = NumbersParser(withString: String(substringView))
			numPairs = parser.parceNumbers(withDelimeter: delimeter.toString)
		}
		else {
			let parser = NumbersParser(withString: numbers);
			numPairs = parser.parceNumbers(withDelimeter: CharacterSet(charactersIn: ",\n"))
		}
		
		let negativeNumbres = numPairs.filter { (pair) -> Bool in
			let (_, val) = pair;
			guard let nonNilVal = val else {
				return false
			}
			
			return nonNilVal < 0
		}
		
		guard negativeNumbres.isEmpty else {
			throw Exception.negativeNumbers(numbers: negativeNumbres.compactMap({ (pair) -> Int? in
				let (_, val) = pair
				return val;
			}))
		}
		
		let sum : Int =  numPairs.reduce(0) { (pRes, pair) -> Int in
			let (_, val) = pair
			guard let nonNilVal = val else {
				return pRes
			}
			guard nonNilVal <= self.maxNum else {
				return pRes
			}
			
			return pRes + nonNilVal
		}
		return sum
	}
	
	
	func delimeter(forString str: String) -> String? {
		return nil

		
	}
	
	
}

