//
//  RegionSettingStorageProtocol.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Domain

public protocol RegionSettingStorageProtocol {
    func fetchRegion(
        completion: @escaping (Result<Region, Error>) -> Void
    )
    func saveRegion(
        updatedRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    )
}
