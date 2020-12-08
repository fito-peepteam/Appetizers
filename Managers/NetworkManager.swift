//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import Foundation

final class NetworkManager {
    
    private init() {}
    
    static let shared = NetworkManager()
    
    private let baseUrl = "https://seanallen-course-backend.herokuapp.com/"
    
    func fetchAppetizers(completion: @escaping (Result<[Appetizer], ALError>) -> Void) {
        
        let endpoint = baseUrl + "swiftui-fundamentals/appetizers"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
                
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil {
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(.invalidData))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                    completion(.success(decodedResponse.request))
                } catch {
                    completion(.failure(.invalidData))
                }
            } else {
                print("There was an error retrieving appetizers data.", error?.localizedDescription ?? "")
                completion(.failure(.unableToComplete))
            }
        }
        dataTask.resume()
    }
}
