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
            ScrollView {
                VStack(spacing: 32) {
                    Image(movie.capaArt)
                        .resizable()
                        .scaledToFit()
                        .matchedGeometryEffect(id: movie.id, in: animation)
                        .frame(width: 200)
                    
                    VStack {
                        Text(movie.nome)
                            .font(.title)
                            .bold()
                            .lineLimit(2)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                        
                        Text(movie.ano.description)
                            .font(.title2)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Sinopse")
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text(movie.sinopse)
                    }
                    
                    HStack(spacing: 32) {
                        Text("Direção")
                            .bold()
                        Spacer()
                        Text(movie.direcao)
                    }
                    
                    HStack(spacing: 32) {
                        Text("Roteiro")
                            .bold()
                        Spacer()
                        Text(movie.roteiristas)
                    }
                }
                .padding(32)
                .navigationTransition(.zoom(sourceID: movie.id, in: animation))
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
            .navigationBarTitle(Text(movie.nome), displayMode: .inline)
        }
    }
}


// MARK: - MovieDetailView - Preview

private struct MovieDetailView_Preview: View {
    @Namespace private var animation
    @ObservedObject private var dataModel: DataModel = .shared
    
    var body: some View {
        MovieDetailView(movie: dataModel.movies.first!, animation: animation)
    }
}

#Preview {
    MovieDetailView_Preview()
}
