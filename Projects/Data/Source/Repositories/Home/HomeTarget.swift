//
//  HomeTarget.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

import Networks
import Moya

public enum HomeTarget {
    case fetchCafesList
    case fetchRoomsList(cafeId: Int)
}

extension HomeTarget: BaseTargetType {
    public var path: String {
        switch self {
        case .fetchCafesList:
            return "v1/cafes"
        case .fetchRoomsList(let cafeId):
            return "v1/cafes/\(cafeId)/rooms"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchCafesList:
            return .get
        case .fetchRoomsList:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchCafesList:
            return .requestPlain
        case .fetchRoomsList(let request):
            return .requestParameters(parameters: request.toDictionary(),
                                      encoding: URLEncoding.queryString)
        }
    }
}
