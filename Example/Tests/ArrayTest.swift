//
//  ArrayTest.swift
//  FunctionalSwiftKit_Tests
//
//  Created by KWANG HYOUN KIM on 08/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest

@testable import FunctionalSwiftKit
class ArrayTest: XCTestCase {
    
    override func setUp() {
    }
    
    func testGroupedForStrings() {
        let source = ["A", "A", "B", "C"]
        let grouped = source.grouped { $0 }
        
        XCTAssertEqual(3, grouped.count)
        XCTAssertEqual(2, grouped["A"]?.count ?? 0)
        XCTAssertEqual(1, grouped["B"]?.count ?? 0)
        XCTAssertEqual(1, grouped["C"]?.count ?? 0)
        XCTAssertEqual(["A", "A"], grouped["A"])
        XCTAssertEqual(["B"], grouped["B"])
        XCTAssertEqual(["C"], grouped["C"])
    }
    func testGroupedForModels() {
        let source = [Model(uid: "A"), Model(uid: "A"), Model(uid: "B"), Model(uid: "C")]
        let grouped = source.grouped { $0.uid }
        
        XCTAssertEqual(3, grouped.count)
        XCTAssertEqual(2, grouped["A"]?.count ?? 0)
        XCTAssertEqual(1, grouped["B"]?.count ?? 0)
        XCTAssertEqual(1, grouped["C"]?.count ?? 0)
        XCTAssertEqual([Model(uid: "A"), Model(uid: "A")], grouped["A"])
        XCTAssertEqual([Model(uid: "B")], grouped["B"])
        XCTAssertEqual([Model(uid: "C")], grouped["C"])
    }
    func testSubtracted() {
        let source = [Model(uid: "A"), Model(uid: "B")]
        let other = [Model(uid: "A")]
        let subtracted = source.subtracted(other)
        
        XCTAssertEqual(1, subtracted.count)
        XCTAssertTrue(subtracted.contains(Model(uid: "B")))
        XCTAssertFalse(subtracted.contains(Model(uid: "A")))
        XCTAssertEqual([Model(uid: "B")], subtracted)
    }
    func testUniqued() {
        let source = [Model(uid: "A"), Model(uid: "A"), Model(uid: "B"), Model(uid: "B")]
        let uniqued = source.uniqued()
        
        XCTAssertEqual(2, uniqued.count)
        XCTAssertEqual([Model(uid: "A"), Model(uid: "B")], uniqued)
    }
}

struct Model: Hashable {
    let uid: String
    var hashValue: Int { return uid.hashValue }
    
    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.uid == rhs.uid
    }
}
