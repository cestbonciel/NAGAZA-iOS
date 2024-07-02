//
//  Regions.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

public struct Regions {
    public let mainRegion: [MainRegion]
}

public struct MainRegion {
    public let region: String
    public let subRegions: [SubRegion]
    public var isSelected: Bool
}

public struct SubRegion {
    public let region: String
    public var themeCount: Int?
}
