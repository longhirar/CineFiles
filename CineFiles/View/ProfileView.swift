//
//  ProfileView.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import SwiftUI




struct ProfileView: View {
    
    @State private var idiomaSelecionado = "Português (Brasil)"
    @State private var mostrarModalIdiomas = false
    
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
            
            VStack {
                Image("capa-perfil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Button{} label:{
                    Text("Conta")
                    Spacer()
                    Image(systemName: "chevron.right")
                    
                    
                }
                Divider().background(Color.gray)
                
                VStack (alignment: .leading){
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Classificações")
                                .foregroundColor(.white)
                                .bold()
                            
                            Text("Gerencie as classificações no site")
                                .foregroundColor(.gray)
                                .font(.caption)
                        }
                        Spacer()
                        Image(systemName:("18.square.fill"))
                        
                        
                    }
                    
                    .padding(.vertical)
                    Divider().background(Color.gray)
                    
                    
                    
                }
                
                .padding()
                
                Button {
                    mostrarModalIdiomas = true
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Idioma de exibição")
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(idiomaSelecionado)
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundColor(.blue)
                        }
                    }
                }
                
                
                
            }
            .sheet(isPresented: $mostrarModalIdiomas) {
                IdiomaModalView(idiomaSelecionado: $idiomaSelecionado)
                    .presentationDetents([.fraction(0.30)])
            }
            
            
        }
    }
}

struct IdiomaModalView: View {
    @Binding var idiomaSelecionado: String
    @Environment(\.dismiss) var dismiss
    
    let opcoes = [
        "Português (Brasil)",
        "Inglês (EUA)",
        "Espanhol (Latino-Americano)"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(opcoes, id: \.self) { idioma in
                    Button(action: {
                        idiomaSelecionado = idioma
                        dismiss() // fecha o modal
                    }) {
                        HStack {
                            Text(idioma)
                                .foregroundColor(.primary)
                            Spacer()
                            if idioma == idiomaSelecionado {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Selecionar idioma")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ok") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
