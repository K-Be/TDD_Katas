//
//  NumbersParserTests.swift
//  StringCalculatorTests
//
//  Created by Andrew Romanov on 24.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import StringCalculator

class NumbersParserTests: XCTestCase {
	
	func testParseNormalValuesStr() {
		let parser = NumbersParser(withString: "1,2,3,4,5,6,7");
		let values = parser.parceNumbers(withDelimeter: ",");
		XCTAssert(values.count == 7, "wrong count of values");
		
		values.forEach { (arg0) in
			let (_, val) = arg0
			XCTAssertNotNil(val);
		}
		
		let sum = values.reduce(0) { (pRes, pair) -> Int in
			let (_, val) = pair
			let result = pRes + (val!)
			return result
		}
		XCTAssertEqual(sum, 28);
	}
	
	
	func testParseNormalValuesCharSet() {
		let parser = NumbersParser(withString: "1,2,3,4,5,6,7");
		let values = parser.parceNumbers(withDelimeter: CharacterSet(charactersIn: ","));
		XCTAssert(values.count == 7, "wrong count of values");
		
		values.forEach { (arg0) in
			let (_, val) = arg0
			XCTAssertNotNil(val);
		}
		
		let sum = values.reduce(0) { (pRes, pair) -> Int in
			let (_, val) = pair
			let result = pRes + (val!)
			return result
		}
		XCTAssertEqual(sum, 28);
	}
	
	
	func testNonParsedValues() {
		let parser = NumbersParser(withString: "4,df4");
		let values = parser.parceNumbers(withDelimeter: ",")
		XCTAssertEqual(values.count, 2)
		
		let (str1, val1) = values[0];
		XCTAssertEqual(val1, 4);
		XCTAssertEqual(str1, "4");
		
		let (str2, val2) = values[1];
		XCTAssertNil(val2);
		XCTAssertEqual(str2, "df4")
	}
	
	

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
