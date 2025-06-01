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
    // @longhirar FIXME: Quando um filme é favoritado ou desfavoritado pela tela da biblioteca, quando o usuário clica no botão de voltar a tela não é atualizada e os filmes previamente favoritados ainda ficam presentes
    @State private var pesquisa = ""
    @State private var filtro: FiltroBiblioteca = .favoritos
    @ObservedObject private var dataModel: DataModel = .shared
    
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
                        ForEach((dataModel.movies.filter {
                            switch filtro {
                            case .favoritos:
                                return $0.favorito
                            case .assistidos:
                                return $0.assistido
                            @unknown default:
                                return false
                            }
                        }).filter {
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
                        }) { movie in
                            MovieCardView(movie: movie)
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
