//
//  LibraryView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct LibraryView: View {
    
    @State private var pesquisa = ""
    @State private var selection = 0
    
    private func movieCard(_ movie: Movie) -> some View {
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
                    Button("Favoritar") {}
                    Button("Marcar como assistido") {}
                } label: {
                    Image(systemName: "ellipsis")
                }
            }
        }
        .frame(width: 150, height: 300)
        .padding()
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Picker("Filtro", selection: $selection) {
                        Text("Favoritos").tag(0)
                        Text("Assistidos").tag(1)
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal, 16)
                    .padding(.top)

                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(DataModel.movies) { movie in
                            movieCard(movie)
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
