//
//  RegionTitle.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

public struct Region: Equatable {
    public let mainRegion: String
    public let subRegion: String
    
    public init(mainRegion: String, subRegion: String) {
        self.mainRegion = mainRegion
        self.subRegion = subRegion
    }
    
    public static func == (lhs: Region, rhs: Region) -> Bool {
        return lhs.mainRegion == rhs.mainRegion && lhs.subRegion == rhs.subRegion
    }
}

extension Region {
    public func toRegions() -> Regions {
        let allRegions = RegionType.allCases.map { regionType -> MainRegion in
            
            let subRegions = regionType.cities.map {
                SubRegion(region: $0, themeCount: nil)
            }
            
            return MainRegion(
                region: regionType.title,
                subRegions: subRegions,
                isSelected: regionType.title == self.mainRegion
            )
        }
        
        return Regions(mainRegion: allRegions)
    }
}
