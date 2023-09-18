//
//  APIManager.swift
//  MVVMWithDiffable
//
//  Created by 권현석 on 2023/09/18.
//

import Foundation

class APIManager {
    
    static let shared = APIManager()
    
    private let key = APIKeys.unsplash
    
    private init() { }
    
    func loadRandomPhoto(completion: @escaping (RandomPhoto) -> Void ) {
    
        guard let url = URL(string: "https://api.unsplash.com/photos/random/?client_id=\(APIKeys.unsplash)") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                return
            }
            
            do {
                let result = try JSONDecoder().decode(RandomPhoto.self, from: data!)
                print("성공")
                completion(result)
                
            } catch {
                print("실패")
                print(error)
            }
        }.resume()
        
    }
    
}
