//
//  Product.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import Foundation

struct Product {
    let title: String
    let category: String
    let weight: Double
    let length: Double
    let width: Double
    let height: Double

    var cubicWeight: Double {
        return (length/100 * width/100 * height/100) * 250
    }
    
    static func averageCubicWeight(_ products: [Product]) -> Double {
        let total = products.reduce(0) { (result, product) -> Double in
            return result + product.cubicWeight
        }
        return total/Double(products.count).rounded()
    }
}

extension Product {
    init?(raw: [String: Any]) {
        guard let title = raw["title"] as? String,
            let category = raw["category"] as? String,
            let weight = raw["weight"] as? Double,
            let size = raw["size"] as? [String: Double],
            let length = size["length"],
            let width = size["width"],
            let height = size["height"] else { return nil }
        self.title = title
        self.category = category
        self.weight = weight
        self.length = length
        self.width = width
        self.height = height
    }
}
