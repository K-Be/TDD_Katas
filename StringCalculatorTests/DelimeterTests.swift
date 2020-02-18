//
//  DelimeterTests.swift
//  StringCalculatorTests
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import StringCalculator


class DelimeterTests: XCTestCase {

    func testValudDelimeter() {
			let str = "\\\\DELIM\n"
			let delimeter = Delimeter(withString: str)
			XCTAssertNotNil(delimeter);
			XCTAssertEqual(delimeter!.toString, "DELIM")
			XCTAssertEqual(delimeter!.delimeterDescriptionRange, Range<String.Index>(NSRange(location: 0, length: 8), in: str))
    }
	
	func testOneSimbolDelimeter() {
		let str = "\\\\;\n1;2"
		let delimeter = Delimeter(withString:str)
		XCTAssertNotNil(delimeter);
		XCTAssertEqual(delimeter!.toString, ";")
		XCTAssertEqual(delimeter!.delimeterDescriptionRange, Range<String.Index>(NSRange(location: 0, length: 4), in: str))
	}
	
	
	func testNonValid() {
		let str = "fsdfdsf\n"
		let delimeter = Delimeter(withString: str)
		XCTAssertNil(delimeter)
	}
	
	
	func testNotVali() {
		let str = "\\\\sdfsdgf,5,6,7"
		let delimeter = Delimeter(withString: str)
		XCTAssertNil(delimeter)
	}
	
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
