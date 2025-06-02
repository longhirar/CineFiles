//
//  OnboardingView.swift
//  CineFiles
//
//  Created by Longhi on 02/06/25.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            ForEach(0..<4) { index in
                Tab {
                    Image("onboarding\(index)")
                        .resizable()
                        .scaledToFit()
                }
            }
            Tab {
                VStack(spacing: 32) {
                    Image("cineFilesLogo")
                        .resizable()
                        .scaledToFit()
                        .padding(32)
                    
                    Text("Bem-vindo!")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Button {
                        LoginManager.shared.localUser?.onboardingComplete = true
                    } label: {
                        Text("Começar!")
                            .buttonStyle(.plain)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding()
                            .background(Color("AccentColor"))
                            .foregroundStyle(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(32)
            }
        }
        .tabViewStyle(.page)
        .background(Color.breto)
    }
}

#Preview {
    OnboardingView()
}
