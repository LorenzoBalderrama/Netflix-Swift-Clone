//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Lorenzo Porras on 5/29/23.
//

import Foundation


struct Constants {
    static let API_Key = "3260ddb0e9fc52f55749ffffdd2d62d8"
    static let baseURL = "https://api.themoviedb.org"
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_Key)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) {data, _, error in
            guard let data = data, error == nil  else {
                return
            }
            
            do {
                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print(results)

            } catch {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
}

