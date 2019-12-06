//
//  ArticleCell.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/7/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .disclosureIndicator
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
}

extension ArticleCell {
    func configure(vm: ArticleViewModel) {
        self.titleLabel.text = vm.title
        self.authorLabel.text = vm.author
        self.articleImageView.image  = vm.image
        self.dateLabel.text = vm.publishedOn
       
    }
}
