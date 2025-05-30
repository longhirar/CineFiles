//
//  LoginManager.swift
//  CineFiles
//
//  Created by Longhi on 29/05/25.
//

import Combine
import Foundation

class LoginManager: ObservableObject {
    static let shared = LoginManager()
    

    private static let userListDefault =  ["rafael@longhi.dev": User(name: "Rafael Longhi", email: "rafael@longhi.dev", password: "12345")]
    
    private var userList: [String : User] = UserDefaults.standard.dictionary(forKey: "users") as? [String : User] ?? userListDefault
//    {
//        didSet {
//            UserDefaults.standard.set(userList, forKey: "users")
//        }
//    }
    
    @Published var localUser: User? = nil
    
    func tryLogin(email: String, password: String) -> Bool {
        guard let user = userList[email.lowercased()] else {
            return false
        }
        
        if (user.password != password) {
            return false
        }
        
        self.localUser = user
        return true
    }
    
    func register(nome: String, email: String, password: String) {
        userList[email.lowercased()] = User(name: nome, email: email.lowercased(), password: password)
    }
    
    func logOut() {
        self.localUser = nil
    }
}

