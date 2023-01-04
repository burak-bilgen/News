//
//  Extensions.swift
//  Stock-News
//
//  Created by Burak Bilgen on 4.01.2023.
//

import Foundation

extension String {
    func formatDate() -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM d, h:mm a"

        if let date = dateFormatterGet.date(from: self) {
            return dateFormatterPrint.string(from: date)
        } else {
            return "Unknown"
        }
    }
}
