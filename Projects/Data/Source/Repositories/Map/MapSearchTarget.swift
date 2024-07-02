//
//  MapSearchTarget.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import Foundation

import Networks
import Moya
import Core

public enum MapSearchTarget {
    case fetchPlacesList(request: KeywordSearchRequest)
}

extension MapSearchTarget: TargetType {
    public var baseURL: URL {
        return URL(string: "https://dapi.kakao.com/v2/")!
    }
    
    public var headers: [String: String]? {
        if let apiKey = Keychain.shared.get(.kakaoApiKey) {
            return [
                "Authorization": "KakaoAK \(apiKey)",
                "Content-Type": "application/json",
            ]
        } else {
            return nil
        }
    }
    
    public var path: String {
        switch self {
        case .fetchPlacesList:
            return "local/search/keyword"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchPlacesList:
            return .get
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .fetchPlacesList(let request):
            return .requestParameters(
                parameters: request.toDictionary(),
                encoding: URLEncoding.queryString
            )
        }
    }
}


