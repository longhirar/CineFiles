//
//  MovieDetailView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    @Binding var movie: Movie
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar {
                HStack {
                    Button {
                        withAnimation {
                            movie.favorito.toggle()
                        }
                        print(movie.favorito.description)
                    } label: {
                        Image(systemName: movie.favorito ? "star.fill" : "star")
                    }
                    
                    Button {
                        withAnimation {
                            movie.assistido.toggle()
                        }
                    } label: {
                        Image(systemName: movie.assistido ? "eye.fill" : "eye")
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: .constant(DataModel.shared.movies.randomElement()!))
}
