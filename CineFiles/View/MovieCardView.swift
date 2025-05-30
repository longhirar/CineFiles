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
                    Button("Favoritar") { movie.favorito.toggle() }
                    Button("Marcar como Assistido") { movie.assistido.toggle() }
                } label: {
                    Image(systemName: "ellipsis.circle.fill")
                }
                .border(.red)
            }
        }
        .frame(width: 150, height: 300)
        .padding()
    }
    
}

#Preview {
    MovieCardView(movie: .constant(DataModel().movies.first!))
}
