//
//  MovieDetailView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Binding<Movie>
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .toolbar {
                HStack {
                    Button {
                        withAnimation {
                            movie.wrappedValue.favorito.toggle()
                        }
                    } label: {
                        Image(systemName: movie.wrappedValue.favorito ? "star.fill" : "star")
                    }
                    
                    Button {
                        withAnimation {
                            movie.wrappedValue.assistido.toggle()
                        }
                    } label: {
                        Image(systemName: movie.wrappedValue.assistido ? "eye.fill" : "eye")
                    }
                }
            }
        }
    }
}

#Preview {
    MovieDetailView(movie: .constant(DataModel.movies.randomElement()!))
}
