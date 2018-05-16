//
//  VideoServiceTests.swift
//  VoiceTube_HWTests
//
//  Created by Nick Yang on 2018/5/16.
//  Copyright © 2018 Nick Yang. All rights reserved.
//

import XCTest
@testable import VoiceTube_HW

class VideoServiceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetVideoDate() {
        let service = VideoService()
        service.getVideoData(respnose: { (array) in
            XCTAssert(service.errorCode == .success)
            
        }) { (code, message) in
            // TODO: use fake data
            switch code {
            case NetworkError.success.rawValue:
                XCTAssert(service.errorCode == .success)
            case NetworkError.timeout.rawValue:
                XCTAssert(service.errorCode == .timeout)
            case NetworkError.parseDataFail.rawValue:
                XCTAssert(service.errorCode == .parseDataFail)
            case NetworkError.APIFail.rawValue:
                XCTAssert(service.errorCode == .APIFail)
            default:
                XCTAssert(service.errorCode != .success)
            }
            
        }
    }
    
}
