//
//  ArticleDetailViewModel.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/7/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation
struct ArticleDetailsViewModel {
    let article: Article
}

extension ArticleDetailsViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleDetailsViewModel {
    
    var description: String {
        return self.article.abstract
    }
}
