//
//  NetworkService.swift
//  accountManager
//
//  Created by Халим Магомедов on 12.03.2022.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject  {
    func getAuthData (completion: @escaping (Result<[UserDataModel]?, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getAuthData(completion: @escaping (Result<[UserDataModel]?, Error>) -> Void) {
        let urlString = ""
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let obj = try JSONDecoder().decode([UserDataModel].self, from: data!)
                completion(.success(obj))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
