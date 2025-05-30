//
//  User.swift
//  CineFiles
//
//  Created by Longhi on 29/05/25.
//

import Foundation

struct User: Identifiable {
    var id: UUID = UUID()
    var name: String
    var email: String
    var password: String
}
