//
//  Place.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import Foundation

public struct PlacePage {
    public let placeList: [Place]
    
    public init(placeList: [Place]) {
        self.placeList = placeList
    }
}

public struct Place {
    public let identifier = UUID()
    public let addressName: String
    public let categoryGroupCode: String
    public let categoryGroupName: String
    public let categoryName: String
    public let distance: String
    public let id: String
    public let phone: String
    public let placeName: String
    public let placeURL: String
    public let roadAddressName: String
    public let x: String
    public let y: String
    
    public init(addressName: String, categoryGroupCode: String, categoryGroupName: String, categoryName: String, distance: String, id: String, phone: String, placeName: String, placeURL: String, roadAddressName: String, x: String, y: String) {
        self.addressName = addressName
        self.categoryGroupCode = categoryGroupCode
        self.categoryGroupName = categoryGroupName
        self.categoryName = categoryName
        self.distance = distance
        self.id = id
        self.phone = phone
        self.placeName = placeName
        self.placeURL = placeURL
        self.roadAddressName = roadAddressName
        self.x = x
        self.y = y
    }
}

extension Place: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    public static func == (lhs: Place, rhs: Place) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
