//
//  RegionSettingRepository.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Domain
import HomeInterface

public final class RegionSettingRepository {
    private var regionSettingStorage: RegionSettingStorageProtocol
    
    public init(regionSettingStorage: RegionSettingStorageProtocol) {
        self.regionSettingStorage = regionSettingStorage
    }
}

extension RegionSettingRepository: RegionSettingRepositoryProtocol {
    public func fetchRegion(
        defaultRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        regionSettingStorage.fetchRegion { [weak self] result in
            switch result {
            case .success(let region):
                completion(.success(region))
            case .failure:
                self?.saveRegion(newRegion: defaultRegion, completion: { result in
                    switch result {
                    case .success(let region):
                        completion(.success(region))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
            }
        }
    }
    
    public func fetchRegionsNoThemeCount(
        defaultRegion: Region,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        regionSettingStorage.fetchRegion { result in
            switch result {
            case .success(let region):
                let regions = region.toRegions()

                completion(.success(regions))
            case .failure:
                let regions = defaultRegion.toRegions()
                
                completion(.success(regions))
            }
        }
    }
    
    public func fetchRegionsThemeCount(
        defaultRegion: Region,
        completion: @escaping (Result<Regions, Error>) -> Void
    ) {
        
    }
    
    public func saveRegion(
        newRegion: Region,
        completion: @escaping (Result<Region, Error>) -> Void
    ) {
        regionSettingStorage.saveRegion(updatedRegion: newRegion, completion: completion)
    }
}
