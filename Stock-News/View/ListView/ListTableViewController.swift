//
//  ListTableViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit
import Kingfisher

typealias TableView = UITableViewDelegate & UITableViewDataSource

enum Cell: String {
    case listCell = "listCell"
}

extension ListViewController: TableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: Cell.listCell.rawValue, for: indexPath) as? ListTableViewCell, let data = viewModel.news.articles?[indexPath.row], let imgURL = data.urlToImage else { return UITableViewCell() }

        cell.titleLabel.text = data.title
        cell.authorLabel.text = data.author ?? "Unknown"

        cell.newsImageView.kf.indicatorType = .activity
        cell.newsImageView.kf.setImage(with: URL(string: imgURL))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.news.articles?.count { return count } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let distance = -listTableView.contentOffset.y
        var rect = topView.frame
        rect.origin.y = distance
        topView.frame = rect
        
        let position = topView.frame.maxY + 30
        
        if position >= view.frame.minY {
            self.topConstant.constant = -300
            self.listTableView.frame.origin.y = position
        }
    }
}
