//
//  MovieGrid.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 4/21/25.
//

import SwiftUI
import SwiftData

struct MovieCard: View {
    @Environment(\.modelContext) var modelContext
    @State var isfavorite: Bool
    
    let movie: Movie
    
    var body: some View {
        ZStack {
            AsyncImage(url: movie.posterURL) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(2/3, contentMode: .fit)
                } else {
                    Color.red
                }
            }
            
            Button {
                toggleFavorite()
            } label: {
                Image(systemName: isfavorite ? "heart.fill" : "heart")
                    .padding(8)
                    .foregroundStyle(isfavorite ? .red : .primary.opacity(0.7))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(6)
        }
    }
    
    func toggleFavorite() {
        isfavorite.toggle()
        
        do {
            if isfavorite {
                let favMovie = FavMovie(
                    id: movie.id,
                    title: movie.title,
                    overview: movie.overview,
                    posterPath: movie.posterPath,
                    releaseDate: movie.releaseDate
                )
                
                modelContext.insert(favMovie)
            } else {
                try modelContext.delete(model: FavMovie.self, where: #Predicate { favMovie in
                    favMovie.id == movie.id
                })
            }
            
            try modelContext.save()
        } catch {
            print("failed to perform the data from the store: \(error)")
        }
    }
}
