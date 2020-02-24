//
//  StringCalculatorNegativeNumersTests.swift
//  StringCalculatorTests
//
//  Created by Andrew Romanov on 24.02.2020.
//  Copyright © 2020 Andrew Romanov. All rights reserved.
//

import XCTest
@testable import StringCalculator

class StringCalculatorNegativeNumersTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
	
	
var calc = StringCalculator();
	
	func testNegativeNumbersException() {
		let string = "2,3,-4"
		
		var inCatch = false
		do {
			let _ = try calc.add(string)
		} catch StringCalculator.Exception.negativeNumbers(let numbers) {
			XCTAssertEqual(numbers.count, 1);
			XCTAssertEqual(numbers[0], -4);
			inCatch = true
		}
		catch {
			XCTAssert(false, "should be here");
		}
		
		XCTAssertTrue(inCatch)
	}
	
	
	func testWithCustonDelimeter() {
		let string = "\\\\DELIMETER\n1DELIMETER2DELIMETER-4"
		var inCatch = false
		do {
			let _ = try calc.add(string)
		} catch StringCalculator.Exception.negativeNumbers(let numbers) {
			XCTAssertEqual(numbers.count, 1);
			XCTAssertEqual(numbers[0], -4);
			inCatch = true
		}
		catch {
			XCTAssert(false, "should be here");
		}
		
		XCTAssertTrue(inCatch)
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
