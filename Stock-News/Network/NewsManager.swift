//
//  NewsManager.swift
//  Stock-News
//
//  Created by Burak Bilgen on 1.01.2023.
//

import Foundation

class NewsManager {
    static let shared = NewsManager()
    
    func getNews(completionHandler: @escaping (([Post]?, String?) -> Void)) {
        let address = "\(NetworkHelper.shared.baseURL)"
        
        NetworkManager.shared.request(type: [Post].self,
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
