//
//  URL+Extensions.swift
//  XebiaTest
//
//  Created by vikaskumar on 12/6/19.
//  Copyright © 2019 Vikas Kumar. All rights reserved.
//

import Foundation

extension URL {
    static func urlForPopularNews(for period: String) -> URL {
        guard let url =  URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=N1AOdn5dFvfka4b8p3H2rPqzAHEggTUL") else { fatalError("String must be proper url") }
        return url
    }
}
