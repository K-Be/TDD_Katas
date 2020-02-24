//
//  Delimeter.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

class Delimeter {
	
	private typealias DelimeterBounds = (begin: String, end: String)
	
	private let short = DelimeterBounds(begin:"//", end:"\n")
	private let long = DelimeterBounds(begin:"//[", end:"]\n");
	
	private let boundsVariants : Array<DelimeterBounds>
	
	init?(withString str: String) {
		
		boundsVariants = [long, short]
		
		let boundN = boundsVariants.first { (boundVariant) -> Bool in
			let (begin, end) = boundVariant
			
			guard let rangeOfDelimeterStart =  str.range(of: begin) else {
				return false
			}
			guard let rangeOfDelimeterEnd = str.range(of:end) else {
				return false
			}
			
			guard rangeOfDelimeterEnd.lowerBound > rangeOfDelimeterStart.upperBound else {
				return false
			}
			
			return true
		}
		guard let bound = boundN else {
			return nil
		}
		
		let rangeOfDelimeterStart = str.range(of: bound.begin)!
		let rangeOfDelimeterEnd = str.range(of: bound.end)!
		
		let range = Range<String.Index>(uncheckedBounds: (lower: rangeOfDelimeterStart.upperBound, upper: str.index(before: rangeOfDelimeterEnd.lowerBound)))
		toString = String(str[range.lowerBound...range.upperBound])
		delimeterDescriptionRange = Range<String.Index>(uncheckedBounds: (lower:rangeOfDelimeterStart.lowerBound, upper:rangeOfDelimeterEnd.upperBound))
	}
	
	private(set) var delimeterDescriptionRange : Range<String.Index>
	private(set) var toString : String
}

