//
//  NumbersParser.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 24.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

struct NumbersParser {
	
	private let str : String
	
	typealias NumPair = (str:String, val:Int?)
	typealias Result = [NumPair]
	
	init(withString str: String) {
		self.str = str
	}
	
	func parceNumbers(withDelimeter delim: CharacterSet) -> [NumPair] {
		let substrings = self.str.components(separatedBy: delim)
		let result = stringsToInt(substrings)
		return result
	}
	
	
	func parceNumbers(withDelimeter delim: String) -> [NumPair] {
		let substrings = self.str.components(separatedBy: delim)
		let result = stringsToInt(substrings)
		return result
	}
	
	private func stringsToInt(_ strArr: [String]) -> [NumPair] {
		let values = strArr.map { (str:String) -> NumPair in
			let result : NumPair = (str, Int(str))
			return result
		}
		
		return values
	}
	
}




