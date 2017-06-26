//
//  NetworkRequest.swift
//  CategoryAverage
//
//  Created by Suraj Pathak on 26/6/17.
//  Copyright © 2017 Suraj Pathak. All rights reserved.
//

import Foundation

/// One of the methods of http request
enum HttpMethod: String {
    case get, put, post, delete
}

/// NetworkRequest is a representation of a normal network request
protocol NetworkRequest {
    
    var url: URL { get }
    var method: HttpMethod { get }
    var body: Data? { get }
    var headers: [String: String] { get }
        
}

/// A list of possible network related errors
enum NetworkError: Error {
    case invalidError
    case serverError
    case custom(message: String)
}
