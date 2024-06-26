//
//  testStarSystems.swift
//  testStarSystems
//
//  Created by Christopher Green on 27/03/2016.
//  Copyright © 2016 Christopher Green. All rights reserved.
//

import XCTest
@testable import StarSystemsCommon

class TestStarSystems: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCreateStarSystem() {
        let star = StarSystem()
        print(star)
    }

    func testSystemNature() {
        let sys1 = SystemNature.solo
        let sys2 = SystemNature.binary
        let sys3 = SystemNature.trinary
        XCTAssertEqual(sys1.description, "Solo")
        XCTAssertNotEqual(sys1.description, "Binary")
        XCTAssertEqual(sys1.rawValue, 0)
        XCTAssertNotEqual(sys1.rawValue, 1)
        XCTAssertEqual(sys2.description, "Binary")
        XCTAssertEqual(sys2.rawValue, 1)
        XCTAssertEqual(sys3.description, "Trinary")
        XCTAssertEqual(sys3.rawValue, 2)
    }
    func testZones() {
        XCTAssertEqual(Zone.H.description, "Habitable")
        XCTAssertNotEqual(Zone.H.description, "Outer")
        XCTAssertEqual(Zone.I.description, "Inner")
        XCTAssertEqual(Zone.O.description, "Outer")
        XCTAssertEqual(Zone.U.description, "Unavailable")
        XCTAssertEqual(Zone.W.description, "Within star")
    }
    func testGasGiant() {
        let s = Star()
        let gg1 = GasGiant(size: .small, parent: s)
        let gg2 = GasGiant(size: .large, parent: s)
        XCTAssertEqual(gg1.size.description, "Small GG")
        XCTAssertEqual(gg2.size.description, "Large GG")
    }
//    func testRollCompanionStar() {
//        let starSystem = StarSystem()
//        for _ in 0..<100 {
//            starSystem.rollCompanionStar(-2, sizeDM: -2)
//        }
//    }
    func testStarHashable() {
        let star1 = Star(type: .A, decimal: 0, size: .V)
        let star2 = Star(type: .A, decimal: 0, size: .V)
        let star3 = Star(type: .B, decimal: 0, size: .V)
        let star4 = Star(type: .A, decimal: 5, size: .V)
        let star5 = Star(type: .A, decimal: 0, size: .IV)
        XCTAssertEqual(star1, star2)
        XCTAssertNotEqual(star1, star3)
        XCTAssertNotEqual(star1, star4)
        XCTAssertNotEqual(star1, star5)
    }

    func testCreateStarSystemPerformance() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
            let star = StarSystem()
            print(star)
        }
    }

}
