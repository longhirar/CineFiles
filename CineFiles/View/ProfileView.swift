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
    @State private var contaSelecionado = "Português (Brasil)"
    @State private var mostrarModalConta = false
    var body: some View {
     
        ZStack{
            
            
            Rectangle()
            .foregroundColor(.clear)
            .frame(width: 402, height: 852)
            .background(
            LinearGradient(
            stops: [
            Gradient.Stop(color: Color(red: 0.11, green: 0.29, blue: 1), location: 0.00),
            Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.56),
            Gradient.Stop(color: .black, location: 1.00),
            ],
            startPoint: UnitPoint(x: 0.5, y: 0),
            endPoint: UnitPoint(x: 0.5, y: 1)
            )
            )

//            Rectangle()
//                .fill(LinearGradient(
//                    stops: [
//                        Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.00),
//                        Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13), location: 0.52),
//                        Gradient.Stop(color: Color(red: 0.04, green: 0.06, blue: 0.13).opacity(0), location: 1.00),
//                    ],
//                    startPoint: UnitPoint(x: 0.5, y: 1),
//                    endPoint: UnitPoint(x: 0.5, y: 0)
//                ))
            
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(Color.white)
                    
                
                if let name = LoginManager.shared.localUser?.name {
                    Text("\(name)")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .padding(.bottom)
                } else {
                    Text("Anônimo")
                        .font(.system(size: 27))
                        .fontWeight(.heavy)
                        .padding(.bottom)
                        
                }
                    
                    
                Button{
                    mostrarModalConta = true
                } label: {
                    HStack {
                        Text("Conta")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .bold()
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundStyle(Color("AccentColor"))
                            .foregroundColor(.blue)
                        
                        
                    }
                    .padding(.vertical,7)
                }
                
                .padding(.top,60)
                
                Divider().background(Color.gray)
                
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Classificação Indicativa")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 18))
                            
                            Text("Gerencie as classificações no site")
                                .foregroundColor(.gray)
                                
                        }
                        Spacer()
                        Image(systemName:("18.square.fill"))
                            .foregroundStyle(Color("AccentColor"))
                            .font(.system(size: 25))
                        
                    }
                    
                    .padding(.vertical,7)
                    Divider().background(Color.gray)
                    
                    
                    
                }
                
                
                Button {
                    mostrarModalIdiomas = true
                } label: {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("Idioma de exibição")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .bold()
                        
                        HStack {
                            Text(idiomaSelecionado)
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.down")
                                .foregroundStyle(Color("AccentColor"))
                                .foregroundColor(.blue)
                            
                        }
                        
                        
                    }
                    .padding(.vertical,7)
                }
                
                Divider().background(Color.gray)
                
                Button{
                    LoginManager.shared.localUser = nil
                } label:{
                    Text("Sair")
                        .frame(maxWidth: .infinity)
                        .padding(16)
                        .background(Color.gray .opacity(0.2))
                        .foregroundStyle(Color("AccentColor"))
                        .clipShape(.buttonBorder)
                    
                        .padding(.top, 50)
                }
                
                
            }
            .padding()
            
            
            
            .sheet(isPresented: $mostrarModalIdiomas) {
                IdiomaModalView(idiomaSelecionado: $idiomaSelecionado)
                    .presentationDetents([.fraction(0.30)])
            }
            
            .sheet(isPresented: $mostrarModalConta) {
                ContaModalView(contaSelecionado: $contaSelecionado)
                    .presentationDetents([.fraction(0.36)])
            }
            
            
        }
        .ignoresSafeArea()
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

struct ContaModalView: View {
    @Binding var contaSelecionado: String
    @Environment(\.dismiss) var dismiss
    
    let opcoes = [
        "Endereço de e-mail",
        "Senha",
        "Nome"
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("E-mail")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 18))
                            
                            if let email = LoginManager.shared.localUser?.email {
                                Text("\(email)")
                                    .foregroundColor(.gray)
                                    
                            } else {
                                Text("*************")
                                    .foregroundColor(.gray)
                            }
                                
                        }
                        Spacer()
                        Image(systemName:("pencil"))
                            .foregroundStyle(Color("AccentColor"))
                            .font(.system(size: 25))
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,7)
                    Divider().background(Color.gray)
                    
                    
                    
                }
                
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Senha")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 18))
                            
                            if let senha = LoginManager.shared.localUser?.password {
                                Text("\(senha)")
                                    .foregroundColor(.gray)
                                    
                            } else {
                                Text("*************")
                                    .foregroundColor(.gray)
                            }
                                
                        }
                        Spacer()
                        Image(systemName:("pencil"))
                            .foregroundStyle(Color("AccentColor"))
                            .font(.system(size: 25))
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,7)
                    Divider().background(Color.gray)
                    
                    
                    
                }
                VStack{
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Nome")
                                .foregroundColor(.white)
                                .bold()
                                .font(.system(size: 18))
                            
                            if let nome = LoginManager.shared.localUser?.name {
                                Text("\(nome)")
                                    .foregroundColor(.gray)
                                    
                            } else {
                                Text("*************")
                                    .foregroundColor(.gray)
                            }
                                
                        }
                        Spacer()
                        Image(systemName:("pencil"))
                            .foregroundStyle(Color("AccentColor"))
                            .font(.system(size: 25))
                        
                    }
                    .padding(.horizontal)
                    .padding(.vertical,7)
                    
                    Divider().background(Color.gray)
                    
                    
                    
                }
                .padding(.bottom,60)
            }
            .padding(.top,60)
            .navigationTitle("Detalhes da Conta")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ok") {
                        dismiss()
                    }
                }
            }
            
            .padding(20)
            
        }
    }
}


#Preview {
    ProfileView()
}
