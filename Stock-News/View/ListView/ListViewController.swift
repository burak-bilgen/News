//
//  ViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listTableView: UITableView!
    
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestData()
    }
    
    private func requestData() {
        viewModel.getNews { error in
            assert(error == nil, "BRUH")
            
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
}
