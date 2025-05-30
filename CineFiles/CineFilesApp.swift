//
//  CineFilesApp.swift
//  CineFiles
//
//  Created by Longhi on 28/05/25.
//

import SwiftUI


@main
struct CineFilesApp: App {
    @ObservedObject private var loginManager = LoginManager.shared
    
    var body: some Scene {
        WindowGroup {
            if loginManager.localUser == nil {
                LoginView()
                    .preferredColorScheme(.dark)
            } else {
                ContentView()
                    .preferredColorScheme(.dark)
            }
        }
    }
}
