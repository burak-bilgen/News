//
//  ListTableViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit

typealias TableView = UITableViewDelegate & UITableViewDataSource

enum Cell: String {
    case listCell = "listCell"
}

extension ListViewController: TableView {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: Cell.listCell.rawValue, for: indexPath) as? ListTableViewCell else { return UITableViewCell() }
        
        cell.textLabel?.text = viewModel.newsArr[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.newsArr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
