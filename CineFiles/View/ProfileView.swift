//
//  ProfileView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
    
        
        ZStack{
            
            VStack {
                Image("capa-perfil")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            
            
            Rectangle()
                .fill(LinearGradient(
                    stops: [
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.52),
                    Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13).opacity(0), location: 1.00),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 1),
                    endPoint: UnitPoint(x: 0.5, y: 0)
                    ))
            
            
        }
    }
}

#Preview {
    ProfileView()
}
