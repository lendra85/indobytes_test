//
//  NetworkManager.swift
//  MyApplication
//
//  Created by Sailendra Salsabil on 24/08/24.
//

import Foundation

protocol NetworkManagerProtocol {
    func fetchUsers(completion: @escaping (Result<[User]?, Error>) -> Void)
}

class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    private let apiUrl = "https://jsonplaceholder.typicode.com/"
    
    func fetchUsers(completion: @escaping (Result<[User]?, any Error>) -> Void) {
        let urlString = "\(apiUrl)users"
        loadGet(urlString: urlString, type: [User]?.self, completion: completion)
        //        guard let url = URL(string: urlString) else { return }
        //
        //        URLSession.shared.dataTask(with: url) { data, response, error in
        //
        //            var result: Result<[User]?, Error>
        //
        //            defer {
        //                DispatchQueue.main.async {
        //                    completion(result)
        //                }
        //            }
        //
        //            if let error = error {
        //                result = .failure(error)
        //            }
        //
        //            guard let data = data else {
        //                result = .success(nil)
        //                return
        //            }
        //
        //            do {
        //                let products = try JSONDecoder().decode([User].self, from: data)
        //                result = .success(products)
        //            }
        //            catch let error {
        //                result = .failure(error)
        //            }
        //
        //        }.resume()
    }
    
    private func loadGet<T: Codable>(urlString: String, type: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            var result: Result<T, Error>
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if let error = error {
                result = .failure(error)
            }
            
            do {
                let products = try JSONDecoder().decode(T.self, from: data!)
                result = .success(products)
            }
            catch let error {
                result = .failure(error)
            }
            
        }.resume()
    }
}
