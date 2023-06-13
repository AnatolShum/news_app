//
//  Settings.swift
//  NewsApp
//
//  Created by Anatolii Shumov on 13/06/2023.
//

import Foundation

class Settings {
    static let shared = Settings()
    
    func dateFormatted(date: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = inputFormatter.date(from: date) {
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        } else {
            return date
        }
    }
    
}
