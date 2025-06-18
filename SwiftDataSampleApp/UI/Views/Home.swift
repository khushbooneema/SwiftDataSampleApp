//
//  Home.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/21/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @State var viewModel = HomeViewModel()
    @Query var favMovies: [FavMovie]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text(error)
            } else {
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 3), spacing: 0) {
                        ForEach(viewModel.movies, id: \.id) { movie in
                            MovieCard(isfavorite: isFavorite(movie.id), movie: movie)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 6)
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Home")
    }
    
    func isFavorite(_ movieId: Int) -> Bool {
        do {
            let favs = try modelContext.fetch(FetchDescriptor<FavMovie>())
            if favs.contains(where: { favMovie in
                favMovie.id == movieId
            }) {
                return true
            }
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        return false
    }
}
