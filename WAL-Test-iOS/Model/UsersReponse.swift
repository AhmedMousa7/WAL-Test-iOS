//
//  UsersReponse.swift
//  WAL-Test-iOS
//
//  Created by Ahmed Mousa on 09/01/2021.
//

import Foundation

struct UsersRespose: Codable {
    let login: String
    let avatar_url: String
    let html_url: String
}

extension UsersRespose {
    
    func toUiModel() -> UserUiModel {
        
        return UserUiModel(name: self.login, imageUrl: URL(string: self.avatar_url),
                           profileUrl: self.html_url)
    }
    
}
