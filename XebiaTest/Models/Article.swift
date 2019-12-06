//
//  Article.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation

struct NewsSourcesResponse: Decodable {
    
    let articles: [Article]
    
    private enum ResponseKeys: String, CodingKey {
        case articles = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ResponseKeys.self)
        self.articles = try container.decode([Article].self, forKey: .articles)
    }
}

struct Article: Decodable {
    
    let title: String
    let byline: String
    let published_date: String
    let abstract: String
}

extension Article {
    static func by(_ period: String) -> Resource<[Article]> {
        return Resource<[Article]>(url: URL.urlForPopularNews(for: period)) { data in
            return try? JSONDecoder().decode(NewsSourcesResponse.self, from: data).articles
        }
    }
}
