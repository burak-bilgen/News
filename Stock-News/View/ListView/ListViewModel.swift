//
//  ListViewModel.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import Foundation

final class ListViewModel {
    
    static let shared = ListViewModel()
    
    var news = News()
    var selectedNewsType: NewsType = .business
    
    func getNews(completionHandler: @escaping ((String?) -> Void)) {
        NewsManager.shared.getNews(with: selectedNewsType) { items, errorMessage in
            if let items {
                self.news = items
            }
            
            completionHandler(errorMessage)
        }
    }
    
    func getSegmentTitle(for index: Int?) {
        switch index {
        case 0: selectedNewsType = .business
        case 1: selectedNewsType = .entertainment
        case 2: selectedNewsType = .tech
        case 3: selectedNewsType = .sports
        default: break
        }
    }
}

enum NewsType: String {
    case business = "Business"
    case entertainment = "Entertainment"
    case tech = "Tech"
    case sports = "Sports"
}
