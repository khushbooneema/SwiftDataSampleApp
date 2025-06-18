//
//  NetworkError.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/18/25.
//

enum NetworkError: Error {
    case badURL
    case requestFailed
    case invalidResponse
    case decodingError
    case unknownError
    case serverError(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .badURL:
            return "The URL is invalid."
        case .requestFailed:
            return "The network request failed."
        case .invalidResponse:
            return "The response from the server was invalid."
        case .decodingError:
            return "There was an error decoding the response."
        case .unknownError:
            return "An unknown error occurred."
        case .serverError(let statusCode):
            return "Server error with status code: \(statusCode)"
        }
    }
}
    
