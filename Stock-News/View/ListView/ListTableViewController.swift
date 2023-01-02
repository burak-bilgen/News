//
//  ListTableViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit
import SDWebImage

typealias TableView = UITableViewDelegate & UITableViewDataSource

enum Cell: String {
    case listCell = "listCell"
}

extension ListViewController: TableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: Cell.listCell.rawValue, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        if let data = viewModel.newsArr.articles?[indexPath.row], let imgURL = data.urlToImage {
            cell.titleLabel.text = data.title
            cell.authorLabel.text = data.author
            cell.newsImageView.sd_setImage(with: URL(string: imgURL))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.newsArr.articles?.count { return count } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
