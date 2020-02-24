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
		XCTAssertEqual(try! calc.add(""), 0)
	}
	
	
	func testOneNumber() {
		for i in 0...1000 {
			XCTAssertEqual(try! calc.add("\(i)"), i)
		}
	}
	
	
	func testTwoNumbers() {
		for num1 in 0...100 {
			for num2 in 0...100 {
				let sum = num1 + num2
				let string = "\(num1),\(num2)"
				XCTAssertEqual(try! calc.add(string), sum)
			}
		}
	}
	
	
	func testWrongStrig() {
		XCTAssertEqual(try! calc.add("dfidsof"), 0)
	}
	
	
	func testManyArguments() {
		XCTAssertEqual(try! calc.add("4,3,6,eefefrefre"), 13)
	}
	
	
	func testSumThreeNumbers() {
		XCTAssertEqual(try! calc.add("1,2,3"), 6)
	}
	
	
	
	func testSumManyNumbers() {
		
		for countArgs in 1...10 {
			let startValue = countArgs + 1
			let seq = Array(startValue...(startValue + countArgs))
			let string = seq.reduce("") { (str:String, val:Int) -> String in
				var res = str;
				if (!str.isEmpty){
					res.append(",")
				}
				res.append("\(val)")
				return res
			}
			
			let sum = seq.reduce(0) { (pSum, val) -> Int in
				return pSum + val
			}
			
			XCTAssertEqual(sum, try! calc.add(string))
		}
		
	}
	
	
	func testNewLineOrComma() {
		let str = "1\n2"
		XCTAssertEqual(try! calc.add(str), 3)
	}
	
	
	func testNewLineAndCommas() {
		let string = "1,2\n3"
		XCTAssertEqual(try! calc.add(string), 6)
	}

	
	func testCustomDelimeter() {
		let string = "\\\\;\n1;2"
		XCTAssertEqual(try! calc.add(string), 3)
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
