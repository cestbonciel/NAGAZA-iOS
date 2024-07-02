//
//  RegionSettingUseCase.swift
//  Nagaza
//
//  Created by 전성훈 on 4/24/24.
//

import Foundation

import Domain

public protocol RegionSettingUseCaseProtocol: AnyObject {
    func fetchRegion(completion: @escaping (Result<Region, Error>) -> Void)
    func fetchRegionsNoThemeCount(completion: @escaping (Result<Regions, Error>) -> Void)
    func fetchRegionsThemeCount(completion: @escaping (Result<Regions, Error>) -> Void)
    
    func saveRegion(newRegion: Region, completion: @escaping (Result<Region, Error>) -> Void)
}

public final class RegionSettingUseCase {
    private let regionSettingRepository: RegionSettingRepositoryProtocol
    private let defaultRegion = Region(mainRegion: "전국", subRegion: "전국")

    
    public init(regionSettingRepository: RegionSettingRepositoryProtocol) {
        self.regionSettingRepository = regionSettingRepository
    }
}

extension RegionSettingUseCase: RegionSettingUseCaseProtocol {
    public func fetchRegion(completion: @escaping (Result<Region, Error>) -> Void) {
        regionSettingRepository.fetchRegion(defaultRegion: defaultRegion, completion: completion)
    }
    
    public func fetchRegionsNoThemeCount(completion: @escaping (Result<Regions, Error>) -> Void) {
        regionSettingRepository.fetchRegionsNoThemeCount(defaultRegion: defaultRegion, completion: completion)
    }
    
    public func fetchRegionsThemeCount(completion: @escaping (Result<Regions, Error>) -> Void) {
        regionSettingRepository.fetchRegionsThemeCount(defaultRegion: defaultRegion, completion: completion)
    }
    
    public func saveRegion(newRegion: Region, completion: @escaping (Result<Region, any Error>) -> Void) {
        regionSettingRepository.saveRegion(newRegion: newRegion, completion: completion)
    }
}
