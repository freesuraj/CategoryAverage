//
//  Page.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import Foundation

struct Page {
    let products: [Product]
    let nextUrl: String?
    
    init(products: [Product], nextUrl: String?) {
        self.products = products
        self.nextUrl = nextUrl
    }
}

extension Page {
    init?(raw: [String: Any]) {
        guard let assests = raw["objects"] as? [[String: Any]] else {
                return nil
        }
        self.products = assests.flatMap { return Product(raw: $0) }
        self.nextUrl = raw["next"] as? String
    }
}
