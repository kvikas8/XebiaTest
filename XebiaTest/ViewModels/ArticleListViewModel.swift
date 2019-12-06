//
//  ArticleListViewModel.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation
struct ArticleListViewModel {
    private(set) var articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
}

extension ArticleListViewModel {
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(self.articles[index])
    }
}
