//
//  News.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 12/06/2023.
//

import Foundation

struct News: Codable {
    let title: String
    let description: String
    let date: String
    let url: URL
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case date = "publishedAt"
        case url = "urlToImage"
    }
}
