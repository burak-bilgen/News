//
//  DetailViewController.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var scrollViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    var data: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configure()
    }
    
    func configure() {
        showData()
        
        shareButton.layer.cornerRadius = 15
        
        let contentHeight = imgView.frame.height + titleLabel.frame.height + descriptionLabel.frame.height + 500
        scrollViewHeight.constant = contentHeight
    }
    
    private func showData() {
        guard let data else { return }
        
        if let url = data.urlToImage {
            imgView.kf.setImage(with: URL(string: url))
        }
        
        titleLabel.text = data.title
        descriptionLabel.text = data.description

        authorLabel.text = data.author
        timeLabel.text = data.publishedAt?.formatDate()
    }
    
    @IBAction func share(_ sender: UIButton) {
        guard let str = data?.url else { return }
        
        if let url = URL(string: str) {
            let text = "News App"
            let activity = UIActivityViewController(activityItems: [url, text], applicationActivities: nil)
            present(activity, animated: true)
        }
    }
    
    @IBAction func visit(_ sender: UIButton) {
        guard let str = data?.url else { return }
        
        if let url = URL(string: str) {
            UIApplication.shared.open(url)
        }
    }
}
