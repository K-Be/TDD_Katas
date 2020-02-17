//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Andrew Romanov on 17.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import StringCalculator



class StringCalculatorTests: XCTestCase {
	
	var calc = StringCalculator();
	
	override func setUp() {
		super.setUp()
	}
	
	
	func testInit() {
		let _ = StringCalculator()
	}

	
	func testEmptyString() {
		XCTAssertEqual(calc.add(""), 0)
	}
	
	
	func testOneNumber() {
		for i in 0...1000 {
			XCTAssertEqual(calc.add("\(i)"), i)
		}
	}
	
	
	func testTwoNumbers() {
		for num1 in 0...100 {
			for num2 in 0...100 {
				let sum = num1 + num2
				let string = "\(num1),\(num2)"
				XCTAssertEqual(calc.add(string), sum)
			}
		}
	}
	
	
	func testWrongStrig() {
		XCTAssertEqual(calc.add("dfidsof"), 0)
	}
	
	
	func testManyArguments() {
		XCTAssertEqual(calc.add("4,3,6,eefefrefre"), 7)
	}
	
	
	
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
