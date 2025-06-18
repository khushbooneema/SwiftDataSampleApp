//
//  SwiftDataSampleAppApp.swift
//  SwiftDataSampleApp
//
//  Created by Khushboo Neema on 6/18/25.
//

import SwiftUI

@main
struct SwiftDataSampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView()
        }
        .modelContainer(for: FavMovie.self)
    }
}

struct TabbarView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("Search")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            Favorites()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
        }
    }
}


