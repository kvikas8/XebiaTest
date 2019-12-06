//
//  ArticleViewModel.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation
import UIKit

struct ArticleViewModel {
    private(set) var article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var author: String? {
        return self.article.byline
    }
    
    var publishedOn: String {
        return self.article.published_date
    }
    
    var image: UIImage {
        return UIImage(named: "placeholder") ?? UIImage() // returning hardcoded as No image Url is present yet other wise async call is needed to load it from url
    }
    
}
