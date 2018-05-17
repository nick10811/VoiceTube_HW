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
    
    func testStringValue() {
        let testString = "true"
        viewModel.setStringValue(testString, type: .autoPlay)
        let storedString = viewModel.getStringValue(type: .autoPlay)
        XCTAssert(testString == storedString)
        
    }
    
    func testDateValue() {
        // FIXME: this test has difference(0.000001) between testDate and storedDate
        let testDate = Date()
        
        do {
            try viewModel.setDateValue(testDate, type: .recommandVideo)
            let storedDate = viewModel.getDateValue(type: .recommandVideo)
            XCTAssert(testDate.timeIntervalSinceReferenceDate-storedDate.timeIntervalSinceReferenceDate <= 0)
        } catch {
            
        }
        
        do {
            try viewModel.setDateValue(testDate, type: .autoPlay)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
        
    }
    
    func testBoolValue() {
        do {
            var testBool: Bool = true
            try viewModel.setBoolValue(testBool, type: .autoPlay)
            var storedBool = viewModel.getBoolValue(type: .autoPlay)
            XCTAssert(testBool == storedBool)
            
            testBool = false
            try viewModel.setBoolValue(testBool, type: .autoPlay)
            storedBool = viewModel.getBoolValue(type: .autoPlay)
            XCTAssert(testBool == storedBool)
            
        } catch {
            
        }
        
        do {
            try viewModel.setBoolValue(true, type: .reminderTime)
        } catch CommonError.invalidInput(let errorMessage) {
            printLog(.error, errorMessage)
            XCTAssert(true)
        } catch {
            XCTAssert(false)
        }
        
    }
    
}
