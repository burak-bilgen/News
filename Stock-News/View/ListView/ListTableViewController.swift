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
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: Cell.listCell.rawValue, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }

        if let data = viewModel.news.articles?[indexPath.row], let imgURL = data.urlToImage {
            cell.titleLabel.text = data.title
            cell.authorLabel.text = data.author ?? "Unknown"
            cell.timeLabel.text = data.publishedAt?.formatDate()

            cell.newsImageView.kf.indicatorType = .activity
            (cell.newsImageView.kf.indicator?.view as? UIActivityIndicatorView)?.color = .white
            
            cell.newsImageView.kf.setImage(with: URL(string: imgURL))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel.news.articles?.count { return count } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailView = UIStoryboard(name: "DetailView", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return }
        
        if let article = viewModel.news.articles?[indexPath.row] {
            detailView.data = article
        }
        
        self.present(detailView, animated: true)
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
