//
//  test_appTests.swift
//  test_appTests
//
//  Created by daffolapmac-179 on 09/05/21.
//

import XCTest
@testable import test_app

class test_appTests: XCTestCase {

    func testAddStuff() {
        let math = MathStuff()
        let result = math.addNumbers(x: 1, y: 2)
        XCTAssertEqual(result, 3)
    }
    
    func testSubtractStuff() {
        let math = MathStuff()
        let result = math.subtractNumbers(x: 9, y: 2)
        XCTAssertEqual(result, 7)
    }
    
    func testMultiplyStuff() {
        let math = MathStuff()
        let result = math.multiplyNumbers(x: 3, y: 2)
        XCTAssertEqual(result, 6)
    }
    
    func testDivideStuff() {
        let math = MathStuff()
        let result = math.divideNumbers(x: 18, y: 2)
        XCTAssertEqual(result, 9)
    }

}
