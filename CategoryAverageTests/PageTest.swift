//
//  PageTest.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import XCTest
@testable import CategoryAverage

class PageTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPageAttributes() {
        guard let raw = TestSampler.shared.valueForKeyPath("Page", "normal") as? [String: Any] else {
            XCTAssert(false)
            return
        }
        let page = Page(raw: raw)
        XCTAssertEqual(page?.products.count, 5)
        XCTAssertEqual(page?.nextUrl, "/api/products/2")
    }
    
    func testPageInvalid() {
        guard let raw = TestSampler.shared.valueForKeyPath("Page", "invalid") as? [String: Any] else {
            XCTAssert(false)
            return
        }
        let page = Page(raw: raw)
        XCTAssertNil(page)
    }
    
}
