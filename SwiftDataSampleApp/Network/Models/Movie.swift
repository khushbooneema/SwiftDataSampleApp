//
//  Untitled.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/18/25.
//
import Foundation

struct MovieResponse: Codable {
    let page: Int? // Optional pagination info
    let results: [Movie]
    let totalPages: Int?
    let totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
         case page, results
         case totalPages = "total_pages"
         case totalResults = "total_results"
     }
}

struct Movie: Codable, Identifiable {
    let id: Int
    let title: String
    let overview: String // Keep overview for potential short display?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case id, title, overview // Include overview if needed here
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
    
    var posterURL: URL {
        guard let posterPath = posterPath else { return URL(string: "")! }
       
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath)")!
    }
}

