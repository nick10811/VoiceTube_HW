//
//  ExtensionTests.swift
//  VoiceTube_HWTests
//
//  Created by Nick Yang on 2018/5/16.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import XCTest
@testable import VoiceTube_HW

class ExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringConverToBool() {
        XCTAssert("True".convertToBool())
        XCTAssert("true".convertToBool())
        XCTAssert("yes".convertToBool())
        XCTAssert("YES".convertToBool())
        XCTAssert("1".convertToBool())
        XCTAssert("False".convertToBool() == false)
        XCTAssert("false".convertToBool() == false)
        XCTAssert("no".convertToBool() == false)
        XCTAssert("NO".convertToBool() == false)
        XCTAssert("0".convertToBool() == false)
        XCTAssert("9999999".convertToBool() == false)
        XCTAssert("asdfqwer".convertToBool() == false)
        XCTAssert("-1".convertToBool() == false)
    }
    
    func testDateToString() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var testDate: Date = dateFormatter.date(from: "20:30")!
        XCTAssert(testDate.toString() == "08:30 PM")
        
        testDate = dateFormatter.date(from: "07:15")!
        XCTAssert(testDate.toString() == "07:15 AM")
    }
    
}
