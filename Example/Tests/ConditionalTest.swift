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
    
    func testIf() {
        var count = 0
        
        condition
            .if(true) { count += 1 }
            .if(false) { count += 1 }
            .if(true) { count += 1 }
            .if(false) { count += 1 }
        
        XCTAssertEqual(2, count)
    }
    func testIfElse() {
        var count = 0
        
        condition
            .if(true) { count += 1 }
            .else {}
        
        condition
            .if(false) { }
            .else { count += 1 }
        
        XCTAssertEqual(2, count)
    }
    func testIfElseElseIf() {
        var count = 0
        condition
            .if(true) { count += 1 }
            .elseif(true) { count += 1 }
            .else { count += 1 }
        
        XCTAssertEqual(1, count)
        
        count = 0
        condition
            .if(false) { count += 1 }
            .elseif(true) { count += 1 }
            .else { count += 1 }
        
        XCTAssertEqual(1, count)
        
        count = 0
        condition
            .if(false) { count += 1 }
            .elseif(false) { count += 1 }
            .else { count += 1 }
        
        XCTAssertEqual(1, count)
    }
    func testChain() {
        var count = 0
        condition
            .if(true) { count += 1 }
            .elseif(true) { count += 1 }
            .else { count += 1 }
            .if(false) { count += 1 }
            .elseif(true) { count += 1 }
            .else { count += 1 }
            .if(false) { count += 1 }
            .elseif(false) { count += 1 }
            .else { count += 1 }
        
        XCTAssertEqual(3, count)
        
        count = 0
        condition
            .if(true) { count += 1 }
            .else { count += 1 }
            .if(true) { count += 1 }
            .else { count += 1 }
            .if(true) { count += 1 }
            .else { count += 1 }
        
        XCTAssertEqual(3, count)
    }
}
