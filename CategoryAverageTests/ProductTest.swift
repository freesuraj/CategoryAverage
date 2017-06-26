//
//  ProductTest.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import XCTest
@testable import CategoryAverage

class ProductTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    /**
     Cubic Weight Example
     A parcel measuring 40cm long (0.4m) x 20cm high (0.2m) x 30cm wide (0.3m) is equal to 0.024 cubic metres.
     Multiplied by the conversion factor of 250 gives a cubic weight of 6kg.
     0.4m x 0.2m x 0.3m = 0.024m3
     0.024m3 x 250 = 6kg
     **/
    func testCubicWeight() {
        let product = Product(title: "", category: "", weight: 20, length: 40, width: 20, height: 30)
        XCTAssertEqual(product.cubicWeight, 6)
    }
    
    func testAverageCubicWeight() {
        let product1 = Product(title: "", category: "", weight: 20, length: 40, width: 20, height: 30) // 6
        let product2 = Product(title: "", category: "", weight: 20, length: 20, width: 20, height: 30) // 3
        let product3 = Product(title: "", category: "", weight: 20, length: 80, width: 20, height: 30) // 12
        XCTAssertEqual(product1.cubicWeight, 6)
        XCTAssertEqual(product2.cubicWeight, 3)
        XCTAssertEqual(product3.cubicWeight, 12)
        let products = [product1, product2, product3]
        let averageCubicWeight = Product.averageCubicWeight(products)
        XCTAssertEqual(averageCubicWeight, 7)
    }
    
    func testProductAttributes() {
        guard let rawProduct = TestSampler.shared.valueForKeyPath("Product", "normal") as? [String: Any] else {
            XCTAssert(false)
            return
        }
        let product = Product(raw: rawProduct)!
        XCTAssertEqual(product.title, "Window Seal for Portable Air Conditioner Outlets")
        XCTAssertEqual(product.category, "Air Conditioners")
        XCTAssertEqual(product.weight, 235)
        XCTAssertEqual(product.length, 26)
        XCTAssertEqual(product.width, 26)
        XCTAssertEqual(product.height, 5)
    }
    
    func testProductInvalid() {
        guard let rawProduct = TestSampler.shared.valueForKeyPath("Product", "invalid") as? [String: Any] else {
            XCTAssert(false)
            return
        }
        let product = Product(raw: rawProduct)
        XCTAssertNil(product)
    }
    
}
