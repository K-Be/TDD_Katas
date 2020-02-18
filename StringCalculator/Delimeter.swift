//
//  Delimeter.swift
//  StringCalculator
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import Foundation

class Delimeter {
	
	private let delimeterStart = "\\\\"
	private let delimeterEnd = "\n"
	
	init?(withString str: String) {
		guard let rangeOfDelimeterStart =  str.range(of: delimeterStart) else {
			return nil
		}
		guard let rangeOfDelimeterEnd = str.range(of: delimeterEnd) else {
			return nil
		}
		
		guard rangeOfDelimeterEnd.lowerBound > rangeOfDelimeterStart.upperBound else {
			return nil
		}
		
		let range = Range<String.Index>(uncheckedBounds: (lower: rangeOfDelimeterStart.upperBound, upper: str.index(before: rangeOfDelimeterEnd.lowerBound)))
		toString = String(str[range.lowerBound...range.upperBound])
		delimeterDescriptionRange = Range<String.Index>(uncheckedBounds: (lower:rangeOfDelimeterStart.lowerBound, upper:rangeOfDelimeterEnd.upperBound))
	}
	
	private(set) var delimeterDescriptionRange : Range<String.Index>
	private(set) var toString : String
}

