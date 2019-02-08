//
//  ConditionalTest.swift
//  FunctionalSwiftKit_Example
//
//  Created by KWANG HYOUN KIM on 08/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

@testable import FunctionalSwiftKit
class ConditionalTest: XCTestCase {
    
    override func setUp() {
    }
    
    func testInit() {
        let isValid = true
        var isTrue = false
        
        Conditional(isValid) {
            isTrue = true
        }
        
        XCTAssertTrue(isTrue)
    }
    func testCan() {
        let isValid = true
        var isTrue = false
        
        Conditional()
            .can { isValid }
            .run {
                isTrue = true
        }
        
        XCTAssertTrue(isTrue)
    }
    func testAlso() {
        let isValid = false
        var isFalse = false
        
        Conditional()
            .can { isValid }
            .also { true }
            .not {
                isFalse = true
        }
        
        XCTAssertTrue(isFalse)
    }
}
