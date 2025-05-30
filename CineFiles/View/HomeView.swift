//
//  HomeView.swift
//  CineFiles
//
//  Created by Longhi on 29/05/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var dataModel: DataModel = .shared
    @State var selectedArt: String = DataModel.shared.movies.first!.capaArt
    @Namespace private var animation
    var body: some View {
        NavigationStack {
            
            ZStack{
                VStack {
                    Image(selectedArt)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                        .animation(.easeOut, value: selectedArt)
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
                
                TabView(selection: $selectedArt){
                    ForEach(dataModel.movies) { movie in
                        Tab(value: movie.capaArt) {
                            NavigationLink (destination: MovieDetailView(movie: movie, animation: animation)) {
                                VStack {
                                    Spacer()
                                    Image(movie.capaArt)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 180)
                                        .cornerRadius(12)
                                        .padding()
                                        .matchedGeometryEffect(id: movie.id, in: animation)
                                        .matchedTransitionSource(id: movie.id, in: animation)
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
                        }
                    }
                }
                .tabViewStyle(.page)
            }
            .frame(width: UIScreen.main.bounds.width)
            .clipped()
        }
    }
}

#Preview {
    HomeView()
}
