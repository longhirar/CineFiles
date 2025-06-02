//
//  CineFilesApp.swift
//  CineFiles
//
//  Created by Longhi on 28/05/25.
//

import SwiftUI


@main
struct CineFilesApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.dark)
        }
    }
}

struct RootView: View {
    @ObservedObject private var loginManager = LoginManager.shared
    
    var body: some View {
        if loginManager.localUser == nil {
            LoginView()
        } else {
            if (!(loginManager.localUser?.onboardingComplete ?? true)) {
                OnboardingView()
            } else {
                ContentView()
            }
        }
    }
}

#Preview {
    RootView()
        .preferredColorScheme(.dark)
}
