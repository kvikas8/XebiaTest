//
//  ArticleService.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation

class ArticleService {
    
    func getPopularArticlesForPeriod(_ period: String, completion: @escaping ([Article]) -> Void) {
        Webservice().load(Article.by(period)) { articles in
            guard let articles = articles else {
                return
            }
            
            DispatchQueue.main.async {
                    completion(articles)
            }
        }
    }
}
