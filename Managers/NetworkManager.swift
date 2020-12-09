//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Fito Toledano on 12/8/20.
//

import UIKit

final class NetworkManager {
    
    private init() {}
    
    static let shared = NetworkManager()
    
    private let baseUrl = "https://seanallen-course-backend.herokuapp.com/"
    private let cache = NSCache<NSString, UIImage>()

    
    func downloadImage(fromUrlString urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        // Checking for existing images in cache
        let cacheKey = NSString(string: urlString)
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        // Network call to retrieve image if it isn't already in cache
        guard let url = URL(string: urlString) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil)
                return
            }
            guard let imageData = data else {
                completion(nil)
                return
            }
            
            guard let downloadedImage = UIImage(data: imageData) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(downloadedImage, forKey: cacheKey)
            completion(downloadedImage)
        }
        dataTask.resume()
    }
    
    
    func fetchAppetizers(completion: @escaping (Result<[Appetizer], ALError>) -> Void) {
        
        let endpoint = baseUrl + "swiftui-fundamentals/appetizers"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
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
        }
        dataTask.resume()
    }
}
