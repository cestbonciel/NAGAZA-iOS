//
//  MapTarget.swift
//  Nagaza
//
//  Created by SeungMin on 3/14/24.
//

import Networks
import Moya

public enum MapTarget {
    case fetchRecentKeywordList
}

extension MapTarget: BaseTargetType {
    public var path: String {
        switch self {
        case .fetchRecentKeywordList:
            return "v1/search/keyword"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchRecentKeywordList:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchRecentKeywordList:
            return .requestPlain
        }
    }
}

