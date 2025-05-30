//
//  HomeView.swift
//  CineFiles
//
//  Created by Longhi on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    
    private func movieTab(_ movie: Movie) -> some View {
        ZStack {
            VStack {
                Image(movie.capaArt)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                Spacer()
            }
            
            Rectangle()
                .fill(LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.35),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13).opacity(0), location: 0.70),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 1),
                    endPoint: UnitPoint(x: 0.5, y: 0)
                    ))
            
            NavigationLink (destination: MovieDetailView(movie: movie)) {
                VStack {
                    Spacer()
                    Image(movie.capaArt)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .cornerRadius(12)
                        .padding()
                    Text(movie.nome)
                        .font(.title2)
                        .lineLimit(2)
                        .padding(.horizontal, 16)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    Text(movie.ano.description)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                    
                }
                .padding(.bottom, 64)
                .foregroundStyle(.white)
            }
            .frame(width: UIScreen.main.bounds.width, height: .infinity)
        }
        .frame(width: UIScreen.main.bounds.width, height: .infinity)
        .clipped()
    }
    
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(DataModel.movies) { movie in
                    Tab {
                        movieTab(movie)
                    }
                }
            }
            .tabViewStyle(.page)
        }
    }
}

#Preview {
    HomeView()
}
