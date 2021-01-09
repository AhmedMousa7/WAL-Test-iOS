//
//  UsersManager.swift
//  WAL-Test-iOS
//
//  Created by Ahmed Mousa on 09/01/2021.
//

import Foundation

struct UsersManager {
    private let baseUrl = "https://api.github.com"
    
    var delgate: UsersManagerDelgate?
    
    func fetchUsersList() {
        let usersUrlString = "\(baseUrl)/users"
        if let url = URL(string: usersUrlString) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if let e = error {
                    print("There is an error while fetching data. \(e)")
                } else if let data = data {
                    parseJson(data)
                }
            }
            task.resume()
        }
    }
    
    private func parseJson(_ data: Data) {
        do {
            let jsonDecoder = JSONDecoder()
            let result = try jsonDecoder.decode([UsersRespose].self, from: data)
            let resultUi = result.map { (response) -> UserUiModel in
                response.toUiModel()
            }
            delgate?.usersListDidFetch(list: resultUi)
        } catch {
            print("There is an error while parsing data. \(error)")
        }
    }
    
}

//MARK: - UsersManagerDelgate

protocol UsersManagerDelgate {
    func usersListDidFetch(list: [UserUiModel])
}
