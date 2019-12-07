//
//  MockWebServiceClient.swift
//  XebiaTestTests
//
//  Created by vikaskumar on 12/7/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation
@testable import XebiaTest
class MockWebbService: WebServiceProtocol {
    
    var shouldReturnError = false
    
    func reset() {
        shouldReturnError = false
    }
    
    func load<T>(_ resource: Resource<T>, completion: @escaping (T?) -> Void) {
        if shouldReturnError {
            completion(nil)
            return
        }
        let mockResponseData = Data(popularNewsMockData.utf8)
        DispatchQueue.main.async {
            completion(resource.parse(mockResponseData))
        }
    }
}

class MockArticleService {
    
    func getPopularArticlesForPeriod(_ period: String, completion: @escaping ([Article]) -> Void) {
        MockWebbService().load(Article.by(period)) { articles in
            guard let articles = articles else {
                return
            }
            
            DispatchQueue.main.async {
                    completion(articles)
            }
        }
    }
    
}
