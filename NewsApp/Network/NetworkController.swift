//
//  NetworkController.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 12/06/2023.
//

import Foundation
import UIKit

class NetworkController {
    
    let url = "https://newsapi.org/v2/everything?q=apple&from=2023-06-11&to=2023-06-11&sortBy=popularity&apiKey=3cd00c5eb2234eafb18af98a5884a6bb"
    
    enum Errors: Error, LocalizedError {
        case itemNotFound
        case imageDataMissing
        case urlNotFound
    }
   
    func fetchNews() async throws -> [News] {
        let urlComponents = URLComponents(string: url)!
        
        let (data, responce) = try await URLSession.shared.data(from: urlComponents.url!)
        
        guard let httpResponce = responce as? HTTPURLResponse,
              httpResponce.statusCode == 200 else { throw Errors.itemNotFound }
        
        let jsonDecoder = JSONDecoder()
        let json = try jsonDecoder.decode(Articles.self, from: data)
        
        return json.articles
    }
    
}
