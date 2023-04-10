//
//  NetworkCall.swift
//  BankApp
//
//  Created by Héctor Rogel on 6/4/23.
//

import Foundation

protocol NetworkCall {
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    func body() throws -> Data?
}

extension NetworkCall {
    func urlRequest(baseURL: String) throws -> URLRequest {
        guard let url = URL(string: baseURL + path) else {
            throw NetworkError.urlNotFound(path)
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = try body()
        return request
    }
}
