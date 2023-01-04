//
//  NewsManager.swift
//  Stock-News
//
//  Created by Burak Bilgen on 1.01.2023.
//

import Foundation

class NewsManager {
    static let shared = NewsManager()
    
    func getNews(with query: NewsType?, completionHandler: @escaping ((News?, String?) -> Void)) {
        
        var address = "\(NetworkHelper.shared.baseURL)/v2/everything?"
        
        if let query { address += "q=\(query.rawValue)" }
    
        NetworkManager.shared.request(type: News.self,
                                      address: address,
                                      method: .get) { response in
            switch response {
            case .success(let items):
                completionHandler(items, nil)
            case .failure(let error):
                completionHandler(nil, error.rawValue)
            }
        }
    }
}
