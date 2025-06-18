//
//  RequestConfig.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/18/25.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct RequestConfig {
    let baseURL: String
    let timeoutInterval: TimeInterval
    let headers: [String: String]
    let queryParameters: [String: String]
    let bodyParameters: [String: Any]?
    let method: HttpMethod
    let path: String
    
    init(baseURL: String,
         timeoutInterval: TimeInterval,
         headers: [String : String],
         queryParameters: [String : String],
         bodyParameters: [String : Any]?,
         method: HttpMethod,
         path: String) {
       
        self.baseURL = baseURL
        self.timeoutInterval = timeoutInterval
        self.headers = headers
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
        self.method = method
        self.path = path
    }
    
    private var queryItems: [URLQueryItem] {
        let queryParams = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        return queryParams
    }
        
    var urlRequest: URLRequest? {
        guard let url = URL(string: baseURL + path) else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.timeoutInterval = timeoutInterval
        request.allHTTPHeaderFields = headers
        
        if let bodyParameters = bodyParameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: bodyParameters, options: [])
        } else {
            request.httpBody = nil
        }
        
        request.url = url.appending(queryItems: queryItems)
        
        return request
    }
}
