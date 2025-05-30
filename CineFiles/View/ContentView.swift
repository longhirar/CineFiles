//
//  ContentView.swift
//  CineFiles
//
//  Created by Longhi on 29/05/25.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var loginManager = LoginManager.shared
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "Breto")
    }

    
    var body: some View {
        TabView {
            Tab("Início", systemImage: "house.fill") {
                HomeView()
            }
            Tab("Biblioteca", systemImage: "square.stack.fill") {
                LibraryView()
            }
            Tab("Buscar", systemImage: "magnifyingglass") {
                SearchView()
            }
            Tab("Perfil", systemImage: "person.fill") {
                ProfileView()
            }
        }
        .background(Color("Breto"))
    }
}

#Preview {
    ContentView()
}
