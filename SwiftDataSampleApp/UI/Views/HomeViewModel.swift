//
//  HomeViewModel.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/21/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var movies: [Movie] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    var movieRequest: MovieServiceProtocol?
    
    init() {
        Task{
            await fetchMovies()
        }
    }
    
    private func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        movieRequest = MovieService()
        
        // Simulate network request
        do {
            isLoading = false
            let movies = try await movieRequest?.fetchMovies()
            self.movies = movies ?? []
        } catch {
            isLoading = false
            errorMessage = "Failed to fetch movies: \(error.localizedDescription)"
        }
    }
}
