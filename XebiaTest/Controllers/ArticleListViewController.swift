//
//  ArticleListViewController.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var articleListVM: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        populatePopularArticles()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Popular News"
    }
    
    private func populatePopularArticles() {
        ArticleService().getPopularArticlesForPeriod("7") { [weak self] articles in
            self?.articleListVM = ArticleListViewModel(articles: articles)
            self?.tableView.reloadData()
        }
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0 :self.articleListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
            fatalError("ArticleCell not found")
        }
        
        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)
        cell.configure(vm: articleVM)
        return cell
    }
}
