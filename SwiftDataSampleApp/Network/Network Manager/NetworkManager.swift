//
//  NetworkManager.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/18/25.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchData<T: Decodable>(config: RequestConfig) async throws -> T
}

@globalActor
actor NetworkActor {
    static let shared = NetworkActor()
}

@NetworkActor
class NetworkManager: NetworkManagerProtocol {
    
    private var sharedSeesion: URLSession = {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 30
        return URLSession(configuration: config)
    }()
    
    func fetchData<T: Decodable>(config: RequestConfig) async throws -> T {
        guard let request = config.urlRequest else {
            throw NetworkError.badURL
        }
        
        let (data, urlResponse) = try await sharedSeesion.data(for: request)
        
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let response = try JSONDecoder().decode(T.self, from: data)
            return response
        } catch {
            throw error
        }
    }
}


