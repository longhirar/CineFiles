//
//  MovieDetailView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    MovieDetailView(movie: DataModel.movies.randomElement()!)
}
