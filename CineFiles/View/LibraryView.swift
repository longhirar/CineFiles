//
//  LibraryView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

enum FiltroBiblioteca: Int, Equatable {
    case favoritos
    case assistidos
}

struct LibraryView: View {
    
    @State private var pesquisa = ""
    @State private var filtro: FiltroBiblioteca = .favoritos
    private var dataModel: DataModel = .shared
        
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Picker("Filtro", selection: $filtro) {
                        Text("Favoritos").tag(FiltroBiblioteca.favoritos)
                        Text("Assistidos").tag(FiltroBiblioteca.assistidos)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                    .padding(.top)
                    .animation(.easeOut, value: filtro)

                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach($dataModel.movies) { $movie in
                            MovieCardView(movie: $movie)
                        }
                    }
                }
            }
            .navigationTitle("Biblioteca")
            .navigationBarTitleDisplayMode(.large)
            .searchable(text: $pesquisa)
        }
    }
}

#Preview {
    LibraryView()
}
