//
//  ListViewModel.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import Foundation

final class ListViewModel {
    
    static let shared = ListViewModel()
    
    var newsArr = News()
    
    func getNews(completionHandler: @escaping ((String?) -> Void)) {
        NewsManager.shared.getNews { items, errorMessage in
            if let items {
                self.newsArr = items
            }
            
            completionHandler(errorMessage)
        }
    }
}
