//
//  TestingTests.swift
//  TestingTests
//
//  Created by Terry Jason on 2023/9/9.
//

import XCTest
@testable import Testing

final class TestingTests: XCTestCase {
    
    let math = MathematicFunctions()
    
    func testAddIntegerFunction() {
        let result = math.addIntegers(x: 8, y: 9)
        
        XCTAssertEqual(result, 17)
    }
    
    func testMultiplyFunction() {
        let result = math.multiplyNumbers(x: 8, y: 9)
        
        XCTAssertEqual(result, 72)
    }
    
    func testDivideFunction() {
        let result = math.divideIntegers(x: 8, y: 9)
        
        XCTAssertEqual(result, 8/9)
    }
    
}

