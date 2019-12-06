//
//  ArticleDetailViewController.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/7/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    var article: Article!
    private var articleDetailsVM: ArticleDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        self.title = "Article Detail"
        
        self.articleDetailsVM = ArticleDetailsViewModel(article)
        
        self.navigationItem.largeTitleDisplayMode = .never
        self.textView.text = self.articleDetailsVM.description
    }
    
}
