//
// ProductRequest.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import Foundation

// ProductRequest represent a network request to fetch a list of products
struct ProductRequest: NetworkRequest {
    
    let url: URL
    var method: HttpMethod = .get
    var body: Data?
    var headers: [String: String] = [:]
    
    init?(pageUrl: String) {
        guard let url = URL(string: Config.baseUrl + pageUrl) else { return nil }
        self.url = url
    }
    
}

struct ProductParser {
    
    static func parsed(_ json: Any) -> Page? {
        guard let response = json as? [String: Any]  else {
                return nil
        }
        return Page(raw: response)
    }
    
}

extension ProductRequest {
    
    typealias ProductFetchBlock = ((Page?) -> Void)
    
    func fetch(_ completion: @escaping ProductFetchBlock) {
        NetworkManager.shared.request(request: self, success: { json in
            completion(ProductParser.parsed(json))
        }, failure: { _ in
            completion(nil)
        })
    }
    
}
