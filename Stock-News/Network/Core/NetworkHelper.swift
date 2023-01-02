//
//  NetworkHelper.swift
//  Stock-News
//
//  Created by Burak Bilgen on 1.01.2023.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum ErrorType: String, Error {
    case invalidData = "Invalid Data"
    case invalidURL = "Invalid URL"
    case generalError = "Unknown Error"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://newsapi.org"
}
