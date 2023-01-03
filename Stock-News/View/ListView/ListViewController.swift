//
//  ViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var topConstant: NSLayoutConstraint!
    @IBOutlet weak var sectionControl: UISegmentedControl!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var listTableView: UITableView!
    
    let indicator = UIActivityIndicatorView()

    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        requestData()
        design()
        
        sectionControl.addTarget(self, action: #selector(sectionChanged(_:)), for: .valueChanged)
    }
    
    private func requestData() {
        viewModel.getSegmentTitle(for: sectionControl.selectedSegmentIndex)
        
        viewModel.getNews { error in
            if let error {
                print(error)
            }
            
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
    }
    
    private func design() {
        indicator.style = .large
        indicator.color = .white
    }
    
    @objc func sectionChanged(_ sender: UISegmentedControl) {
        requestData()
    }
}
