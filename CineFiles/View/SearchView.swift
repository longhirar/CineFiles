//
//  SearchView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct SearchView: View {
    @State private var pesquisa = ""
    @ObservedObject private var dataModel: DataModel = .shared

    var filmesFiltrados: [Movie] {
        let texto = pesquisa.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !texto.isEmpty else {
            return dataModel.movies
        }
        
        let prefixMatches = dataModel.movies.filter {
            $0.nome.lowercased().hasPrefix(texto.lowercased())
        }
        
        let otherMatches = dataModel.movies.filter {
            $0.nome.lowercased().contains(texto.lowercased()) &&
            !$0.nome.lowercased().hasPrefix(texto.lowercased())
        }
        
        return prefixMatches + otherMatches
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()]) {
                    ForEach(filmesFiltrados) { movie in
                        MovieCardView(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Buscar")
            .navigationBarTitleDisplayMode(.large)
        }
        .searchable(text: $pesquisa, prompt: "Buscar filmes")
    }
}

#Preview {
    SearchView()
}
