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
        dataModel.movies.filter {
            if pesquisa.isEmpty {
                return true
            }
            
            if $0.nome.lowercased().contains(pesquisa.lowercased()) {
                return true
            }
                
            if $0.ano.description.lowercased().contains(pesquisa.lowercased()) {
                return true
            }
            
            if $0.direcao.lowercased().contains(pesquisa.lowercased()) {
                return true
            }
            
            if $0.roteiristas.lowercased().contains(pesquisa.lowercased()) {
                return true
            }
            
            return false
        }
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
