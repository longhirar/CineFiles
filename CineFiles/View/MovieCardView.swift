//
//  MovieCardView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct MovieCardView: View {
    @Binding var movie: Movie
        
    var body: some View {
        VStack(alignment: .leading) {
            Image(movie.capaArt)
                .resizable()
                .scaledToFit()
            Text(movie.nome)
                .font(.headline)
            Spacer()
            HStack {
                Text(movie.ano.description)
                Spacer()
                Menu {
                    Button { movie.favorito.toggle() } label: {
                        HStack {
                            Image(systemName: movie.favorito ? "star.fill" : "star")
                            Text(movie.favorito ? "Remover Favorito" : "Favoritar")
                        }
                    }
                    
                    Button { movie.assistido.toggle() } label: {
                        HStack {
                            Image(systemName: movie.assistido ? "eye.fill" : "eye")
                            Text(movie.favorito ? "Desmarcar como Assistido" : "Marcar como Assistido")
                        }
                    }
                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                }
            }
        }
        .frame(width: 150, height: 300)
        .padding()
        .contextMenu {
            Button { movie.favorito.toggle() } label: {
                HStack {
                    Image(systemName: movie.favorito ? "star.fill" : "star")
                    Text(movie.favorito ? "Remover Favorito" : "Favoritar")
                }
            }
            
            Button { movie.assistido.toggle() } label: {
                HStack {
                    Image(systemName: movie.assistido ? "eye.fill" : "eye")
                    Text(movie.favorito ? "Desmarcar como Assistido" : "Marcar como Assistido")
                }
            }
        }
    }
    
}

private struct MovieCardView_Preview: View {
    @ObservedObject private var dataModel = DataModel.shared
    
    var body: some View {
        MovieCardView(movie: $dataModel.movies.first!)
    }
}

#Preview {
    MovieCardView_Preview()
}
