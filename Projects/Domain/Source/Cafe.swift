//
//  Cafe.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

// TODO: 지울 예정
// 매장명    지점    지역    주소    위도    경도    매장 URL    매장 이미지 URL    총 테마 개수

import Foundation

public struct Cafe {
    public let id: Int
    public let name: String
    public let branch: String
    public let area: String
    public let address: String
    public let location: Location
    public let storeUrlString: String
    public let storeImageUrlString: String
    public let totalNumberOfThemes: Int
    
    public init(id: Int, name: String, branch: String, area: String, address: String, location: Location, storeUrlString: String, storeImageUrlString: String, totalNumberOfThemes: Int) {
        self.id = id
        self.name = name
        self.branch = branch
        self.area = area
        self.address = address
        self.location = location
        self.storeUrlString = storeUrlString
        self.storeImageUrlString = storeImageUrlString
        self.totalNumberOfThemes = totalNumberOfThemes
    }
}

public struct Location {
    public let latitude: Double
    public let longitude: Double
    
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

public struct CafesPage {
    public let cafes: [Cafe]
    public let page: Int
    public let totalPages: Int
    
    public init(cafes: [Cafe], page: Int, totalPages: Int) {
        self.cafes = cafes
        self.page = page
        self.totalPages = totalPages
    }
}

extension Cafe: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Cafe, rhs: Cafe) -> Bool {
        lhs.id == rhs.id
    }
}
