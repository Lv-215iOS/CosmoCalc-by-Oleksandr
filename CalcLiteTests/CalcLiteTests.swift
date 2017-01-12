//
//  CalcLiteTests.swift
//  CalcLiteTests
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import XCTest
@testable import CalcLite

class CalcLiteTests: XCTestCase {
    
    //var brain = CalculatorHead()
    var brain: CalculatorHead? = nil
    var result: Double? = nil
    override func setUp() {
        super.setUp()
        brain = CalculatorHead()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        brain = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    //1) 7 - 4 = 3
    func test7Min4Equal3() {
        brain?.digit(value: 7)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 4)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 3)
    }
    //2) 15-3-2=10
    func test15Min3Min2Equal10() {
        brain?.digit(value: 15)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 3)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 2)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 10)
    }
    //3) 2-3.5=-1.5
    func test2Min3dot5Equalminus1dot5() {
        brain?.digit(value: 2)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 3.5)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -1.5)
    }
    //4) 5-11=-6
    func test5Min11Equalminus6() {
        brain?.digit(value: 5)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 11)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -6)
    }
    //5) 3.56-1.75=1.81
    func test3dot55Min1dot75Equal1dot8() {
        brain?.digit(value: 3.56)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 1.75)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 1.81)
    }
    //6) 9-0=9
    func test9Min0Equal9() {
        brain?.digit(value: 9)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 0)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 9)
    }
    //7) -10-0.5=-10.5
    func testminus10Min0dot5Equalminus10dot5() {
        brain?.digit(value: -10)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 0.5)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -10.5)
    }
    //8) -5-(-3)=-2
    func testminus5Minminus3Equalminus2() {
        brain?.digit(value: -5)
        brain?.binary(operation: .Minus)
        brain?.digit(value: -3)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -2)
    }
    //9) 3-4.5-(-2)=0.5
    func test3Min4dot5Minminus2Equal0dot5() {
        brain?.digit(value: 3)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 4.5)
        brain?.binary(operation: .Minus)
        brain?.digit(value: -2)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 0.5)
    }
    //10) 0-1=-1
    func test0Min1Equalminus1() {
        brain?.digit(value: 0)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 1)
        brain?.result = {(value, error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == -1)
    }
    //11 Int Minus less than intMax
    func testIntMinLessThanIntMax() {
        brain?.digit(value: 8)
        brain?.binary(operation: .Div)
        brain?.digit(value: 6)
        brain?.result = { (value,error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result! < Double(Int.max))
    }
    //12 Int Minus more than intMin
    func testIntMinMoreThanIntMin() {
        brain?.digit(value: 10)
        brain?.binary(operation: .Minus)
        brain?.digit(value: 5)
        brain?.result = { (value,error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result! > Double(Int.min))
    }
    //-4-(-7)-(-3)=6
    func testminus4Minminus7Minminus3Equal6() {
        brain?.digit(value: -4)
        brain?.binary(operation: .Minus)
        brain?.digit(value: -7)
        brain?.binary(operation: .Minus)
        brain?.digit(value: -3)
        brain?.result = { (value,error) in
            self.result = value
        }
        brain?.utility(operation: .Equal)
        XCTAssert(result == 6)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
	
