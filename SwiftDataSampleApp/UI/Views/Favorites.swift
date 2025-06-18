//
//  Favorites.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 6/17/25.
//

import SwiftUI
import SwiftData

struct Favorites: View {
    
    @Query var favorites: [FavMovie]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        Text("Favorites count: \(favorites.count)")
    }
}
