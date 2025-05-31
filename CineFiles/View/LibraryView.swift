////
////  LibraryView.swift
////  CineFiles
////
////  Created by Longhi on 30/05/25.
////
//
//import SwiftUI
//
//enum FiltroBiblioteca: Int, Equatable {
//    case favoritos
//    case assistidos
//}
//
//struct LibraryView: View {
//    
//    @State private var pesquisa = ""
//    @State private var filtro: FiltroBiblioteca = .favoritos
//    @ObservedObject private var dataModel: DataModel = .shared
//        
//    var body: some View {
//        NavigationStack {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    Picker("Filtro", selection: $filtro) {
//                        Text("Favoritos").tag(FiltroBiblioteca.favoritos)
//                        Text("Assistidos").tag(FiltroBiblioteca.assistidos)
//                    }
//                    .pickerStyle(.segmented)
//                    .padding(.horizontal, 16)
//                    .padding(.top)
//                    .animation(.easeOut, value: filtro)
//
//                    LazyVGrid(columns: [GridItem(), GridItem()]) {
//                        ForEach(dataModel.movies) { movie in
//                            MovieCardView(movie: movie)
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Biblioteca")
//            .navigationBarTitleDisplayMode(.large)
//            .searchable(text: $pesquisa)
//        }
//    }
//}
//
//#Preview {
//    LibraryView()
//}

import SwiftUI

enum FiltroBiblioteca: Int, Equatable {
    case favoritos
    case assistidos
}

struct LibraryView: View {
    
    @State private var pesquisa = ""
    @State private var filtro: FiltroBiblioteca = .favoritos
    @ObservedObject private var dataModel: DataModel = .shared
    
    var filteredMovies: [Movie] {
        let baseList: [Movie]
        
        switch filtro {
        case .favoritos:
            baseList = dataModel.movies.filter { $0.favorito }
        case .assistidos:
            baseList = dataModel.movies.filter { $0.assistido }
        }
        
        if pesquisa.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return baseList
        } else {
            return baseList.filter {
                $0.nome.localizedCaseInsensitiveContains(pesquisa)
            }
        }
    }
    
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

                    if filteredMovies.isEmpty {
                        Text("Nenhum filme encontrado.")
                            .padding()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else {
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(filteredMovies) { movie in
                                MovieCardView(movie: movie)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Biblioteca")
            .navigationBarTitleDisplayMode(.large)
            
        }
        .searchable(text: $pesquisa)
    }
    
}

#Preview {
    LibraryView()
}
