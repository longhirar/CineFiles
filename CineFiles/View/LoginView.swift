
import SwiftUI

import HexColor

enum LoginViewState {
    case login
    case register
}

enum FailedLoginReason {
    case usernameOrPasswordWrong
    case emptyUsername
    case emptyPassword
    case emptyName
}

struct LoginView: View {
    @State private var isRegister: Bool = false
    @State private var showForgotPassword: Bool = false
    @State private var nome: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var failedLogin: FailedLoginReason? = nil
    
    private func nomeTextField(name: String, placeholder: String, text: Binding<String>) -> some View {
        VStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(placeholder, text: text)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.clear)
                        .stroke(failedLogin == .emptyName ? .red : .gray, lineWidth: 1)
                }
            if failedLogin == .emptyName {
                Text("Campo obrigatório.")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
    }
    
    private func emailTextField(name: String, placeholder: String, text: Binding<String>) -> some View {
        VStack {
            Text(name)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField(placeholder, text: text)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.clear)
                        .stroke(failedLogin == .emptyUsername || failedLogin == .usernameOrPasswordWrong ? .red : .gray, lineWidth: 1)
                }
            if (failedLogin == .usernameOrPasswordWrong) {
                Text("E-mail ou senha incorretos, tente novamente.")
                    .font(.caption)
                    .foregroundStyle(.red)
            } else if failedLogin == .emptyUsername {
                Text("Campo obrigatório.")
                    .font(.caption)
                    .foregroundStyle(.red)
            }
        }
    }
    
    private func secureTextField(name: String, placeholder: String, text: Binding<String>) -> some View {
        VStack {
            HStack {
                Text(name)
                Spacer()
                Button("Recuperar senha") {
                    showForgotPassword = true
                }
                
            }
            SecureField(placeholder, text: text)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.clear)
                        .stroke(failedLogin == .emptyPassword || failedLogin == .usernameOrPasswordWrong ? .red : .gray, lineWidth: 1)
                }
            if (failedLogin == .usernameOrPasswordWrong) {
                Text("E-mail ou senha incorretos, tente novamente.")
                    .font(.caption)
                    .foregroundStyle(.red)
            } else if failedLogin == .emptyPassword {
                    Text("Campo obrigatório.")
                        .font(.caption)
                        .foregroundStyle(.red)
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            Image("cineFilesLogo")
            
            Image("loginStripes")
            
//            Text("Bem-vinde")
//                .font(.title)
            
            
            
            if (isRegister) {
                nomeTextField(name: "Nome", placeholder: "Insira seu nome", text: $nome)
            }
            
            emailTextField(name: "E-mail", placeholder: "Insira seu e-mail", text: $email)
            
            secureTextField(name: "Senha", placeholder: "Insira sua senha", text: $password)
            
            Button {
                if (email.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty {
                    withAnimation {
                        failedLogin = .emptyUsername
                    }
                    return
                }
                
                if (password.trimmingCharacters(in: .whitespacesAndNewlines)).isEmpty {
                    withAnimation {
                        failedLogin = .emptyPassword
                    }
                    return
                }
                
                if nome.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && isRegister {
                    withAnimation {
                        failedLogin = .emptyName
                    }
                    return
                }
                
                if (isRegister) {
                    LoginManager.shared.register(nome: nome, email: email, password: password)
                }
                
                let isValid = LoginManager.shared.tryLogin(email: email, password: password)
                if !isValid {
                    withAnimation {
                        failedLogin = .usernameOrPasswordWrong
                    }
                    return
                }
                failedLogin = nil
                
                
            } label: {
                Text(isRegister ? "Cadastrar" : "Login")
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color("AccentColor"))
                    .foregroundStyle(.white)
                    .cornerRadius(10)
            }
            
            
            Divider()
            
            Button{
                withAnimation {
                    failedLogin = nil
                    isRegister.toggle()
                }
            } label: {
                Text(isRegister ? "Já possuo uma Conta" : "Não tenho uma conta")
                    .buttonStyle(.plain)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color("AccentColor").opacity(0.2))
                    .cornerRadius(10)
                    .foregroundStyle(Color("AccentColor"))
            }
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .alert("Recuperar Senha", isPresented: $showForgotPassword) {
            Button("OK") { }
        } message: {
            Text("Siga as instruções enviadas para o seu e-mail.")
        }
    }
}

#Preview {
    LoginView()
}
