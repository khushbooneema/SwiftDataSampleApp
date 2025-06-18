//
//  MovieService.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/18/25.
//

import Foundation

protocol MovieServiceProtocol {
    func fetchMovies() async throws -> [Movie]
}

class MovieService: MovieServiceProtocol {
    
    private var discoverMovieRequest: RequestConfig {
        let requestConfig = RequestConfig(
            baseURL: NetworkConfig.baseURLString,
            timeoutInterval: 30,
            headers: [
                "accept": "application/json",
                "authorization": NetworkConfig.apiKey
            ],
            queryParameters: [
                "language":"en-US",
                "adult": "false",
                "include_video": "false",
                "page": "1",
                "sort_by": "popularity.desc",
            ],
            bodyParameters: nil,
            method: HttpMethod.get,
            path: "/discover/movie")
            
        return requestConfig
    }
        
    
    func fetchMovies() async throws -> [Movie] {
        let networkManager = await NetworkManager()
    
        let data: MovieResponse = try await networkManager.fetchData(config: discoverMovieRequest)
        return data.results
    }
}
