//
//  NetworkManagerTest.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import XCTest
@testable import CategoryAverage

class NetworkManagerTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testAsyncCall() {
        let page1 = "/api/products/1"
        let request = ProductRequest(pageUrl: page1)
        guard let productRequest = request else {
            XCTAssert(false)
            return
        }
        let networkManager = NetworkManager.shared
        let expectation = self.expectation(description: "Network_Success")
        networkManager.request(request: productRequest, success: { json in
            let parsedResult = ProductParser.parsed(json)
            XCTAssertNotNil(parsedResult)
            XCTAssertTrue(parsedResult!.products.count > 0)
            expectation.fulfill()
        }) { _ in }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
