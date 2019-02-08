//
//  OptionalTest.swift
//  FunctionalSwiftKit_Tests
//
//  Created by KWANG HYOUN KIM on 08/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

@testable import FunctionalSwiftKit
class OptionalTest: XCTestCase {
    
    override func setUp() {
    }
    
    func testUnwrap() {
        let string: String? = "string"
        
        string.unwrap {
            XCTAssertNotNil($0)
            XCTAssertEqual("string", $0)
        }
    }
}
