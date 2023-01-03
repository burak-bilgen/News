//
//  ListTableViewCell.swift
//  Stock-News
//
//  Created by Burak Bilgen on 31.12.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        authorLabel.text = ""
        newsImageView.image = nil
    }
}
