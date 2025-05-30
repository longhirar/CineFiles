//
//  MovieDetailView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var movie: Movie
    let animation: Namespace.ID
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(movie.capaArt)
                    .resizable()
                    .scaledToFit()
                    .matchedGeometryEffect(id: movie.id, in: animation)
                    .frame(width: 200)

            }
            .navigationTransition(.zoom(sourceID: movie.id, in: animation))

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

//#Preview {
//    MovieDetailView(movie: DataModel.shared.movies.randomElement()!)
//}
