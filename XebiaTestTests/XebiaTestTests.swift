//
//  XebiaTestTests.swift
//  XebiaTestTests
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import XCTest
@testable import XebiaTest

class XebiaTestTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testArticleListResponseParsingAndParsedArticlValuesAreNotNil() {
        let expectation =  self.expectation(description: "Article List Parsing Expectation")
        let mockArticleService = MockArticleService()
        mockArticleService.getPopularArticlesForPeriod("7") { (articles) in
            XCTAssertNotNil(articles)
            for article in articles {
                XCTAssertNotNil(article.title)
                XCTAssertNotNil(article.abstract)
                XCTAssertNotNil(article.published_date)
            }
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testArticleListIsDecodable() {
           let decodedObj = try? JSONDecoder().decode(NewsSourcesResponse.self, from: Data(popularNewsMockData.utf8)).articles
           XCTAssertNotNil(decodedObj)
       }
    
    func testArticleViewModelValues() {
        let article = Article.init(title: "Test Article", byline: "Vikas", published_date: "2019-11-29", abstract: "Test Description")
        let articleViewModel = ArticleViewModel.init(article)
        XCTAssertEqual(articleViewModel.title, article.title)
        XCTAssertEqual(articleViewModel.author, article.byline)
        XCTAssertEqual(articleViewModel.publishedOn, article.published_date)
       }
    
    func testArticleDetailViewModelValues() {
     let article = Article.init(title: "Test Article", byline: "Vikas", published_date: "2019-11-29", abstract: "Test Description")
     let articleViewModel = ArticleDetailsViewModel.init(article)
     XCTAssertEqual(articleViewModel.description, article.abstract)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
