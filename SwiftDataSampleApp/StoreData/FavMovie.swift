//
//  FavMovie.swift
//  MovieApp_copilot
//
//  Created by Khushboo Neema on 6/17/25.
//

import SwiftData

@Model

final class FavMovie {
    var id: Int
    var title: String
    var overview: String
    var posterPath: String?
    var releaseDate: String?
    
    init(id: Int, title: String, overview: String, posterPath: String?, releaseDate: String?) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
    }
}

