//
//  NetworkManager.swift
//  Stock-News
//
//  Created by Burak Bilgen on 1.01.2023.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(type: T.Type, address: String, method: HTTPMethod, completionHandler: @escaping ((Result<T, ErrorType>) -> Void)) {
        
        let session = URLSession.shared
        
        if let address = URL(string: address + "&apiKey=\(apiKey)") {
            var request = URLRequest(url: address)
            request.httpMethod = method.rawValue
            
            let dataTask = session.dataTask(with: request) { data, response, error in
                
                if error != nil { completionHandler(.failure(.generalError)) }
                
                guard let data else { return completionHandler(.failure(.invalidURL)) }
                
                self.handleResponse(data: data) { response in
                    completionHandler(response)
                }
            }
            
            dataTask.resume()
        }
    }
    
    fileprivate func handleResponse<T: Codable>(data: Data, completionHandler: @escaping ((Result<T, ErrorType>) -> Void)) {
        do {
            let result = try JSONDecoder().decode(T.self, from: data)
            completionHandler(.success(result))
        } catch {
            completionHandler(.failure(.invalidData))
        }
    }
    
    private init { }
}
