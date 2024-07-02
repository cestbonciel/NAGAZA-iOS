//
//  MapUseCase.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import RxSwift
import Domain

public protocol MapUseCaseProtocol {
    func fetchPlaces(with keyword: String) -> Single<PlacePage>
//    func fetchRecentKeywordList() -> Single<RecentKeywordPage>
}

public final class MapUseCase: MapUseCaseProtocol {
    private let mapRepository: MapRepositoryProtocol
//    private let recentSearchRepository: Recent
    
    
    public init(repository: MapRepositoryProtocol) {
        self.mapRepository = repository
    }
    
    public func fetchPlaces(with keyword: String) -> Single<PlacePage> {
        return mapRepository.fetchPlaces(with: keyword)
    }
    
//    func fetchRecentKeywordList() -> Single<RecentKeywordPage> {
//        request(
//            type: RecentKeywordResponse.self,
//            target: .fetchRecentKeywordList
//        )
//        .map { $0.toDomain() }
//    }
}
