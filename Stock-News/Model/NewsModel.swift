//
//  NewsModel.swift
//  Stock-News
//
//  Created by Burak Bilgen on 2.01.2023.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
