//
//  RecentKeyword.swift
//  Nagaza
//
//  Created by SeungMin on 3/13/24.
//

import Foundation

public enum SearchSection {
    case home
}

public struct RecentKeyword: Hashable {
    public let identifier = UUID()
    public let keyword: String
    
    public init(keyword: String) {
        self.keyword = keyword
    }
}

public struct RecentKeywordPage {
    public let keywordList: [RecentKeyword]
    public let page: Int
    public let totalPages: Int
    
    public init(keywordList: [RecentKeyword], page: Int, totalPages: Int) {
        self.keywordList = keywordList
        self.page = page
        self.totalPages = totalPages
    }
}

extension RecentKeyword {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(identifier)
  }
    
  public static func == (lhs: RecentKeyword, rhs: RecentKeyword) -> Bool {
    lhs.identifier == rhs.identifier
  }
}
