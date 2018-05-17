//
//  SettingViewModelTests.swift
//  VoiceTube_HWTests
//
//  Created by Nick Yang on 2018/5/16.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import XCTest
@testable import VoiceTube_HW

class SettingViewModelTests: XCTestCase {
    let viewModel = SettingViewModel()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetStringValue() {
        let testString = "true"
        viewModel.setStringValue(testString, type: .autoPlay)
        let storedString = viewModel.getStringValue(type: .autoPlay)
        XCTAssert(testString == storedString)
        
    }
    
    func testSetDateValue() {
        // FIXME: this test has difference(0.000001) between testDate and storedDate
        let testDate = Date()
        viewModel.setDateValue(testDate, type: .recommandVideo)
        let storedDate = viewModel.getDateValue(type: .recommandVideo)
        XCTAssert(testDate.timeIntervalSinceReferenceDate-storedDate.timeIntervalSinceReferenceDate <= 0)
        
    }
    
    func testSetBoolValue() {
        var testBool: Bool = true
        viewModel.setBoolValue(testBool, type: .autoPlay)
        var storedBool = viewModel.getBoolValue(type: .autoPlay)
        XCTAssert(testBool == storedBool)
        
        testBool = false
        viewModel.setBoolValue(testBool, type: .autoPlay)
        storedBool = viewModel.getBoolValue(type: .autoPlay)
        XCTAssert(testBool == storedBool)
        
    }
    
}
