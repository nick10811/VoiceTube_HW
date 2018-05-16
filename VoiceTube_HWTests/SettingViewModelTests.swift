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
    
    func testSetSettingValue() {
        let testString = "true"
        viewModel.setSettingValue(testString, type: .autoPlay)
        let storedString = viewModel.getSettingValue(type: .autoPlay)
        XCTAssert(testString == storedString)
        
    }
    
    func testSetTimeValue() {
        // FIXME: this test has difference(0.000001) between testDate and storedDate
        let testDate = Date()
        viewModel.setTimeValue(testDate, type: .recommandVideo)
        let storedDate = viewModel.getTimeValue(type: .recommandVideo)
        XCTAssert(testDate.timeIntervalSinceReferenceDate-storedDate.timeIntervalSinceReferenceDate <= 0)
        
    }
    
}
