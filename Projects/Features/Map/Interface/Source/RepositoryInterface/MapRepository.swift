//
//  MapRepository.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import RxSwift
import Domain

public protocol MapRepositoryProtocol {
    func fetchPlaces(with keyword: String) -> Single<PlacePage>
//    func fetchRecentKeywordList() -> Single<RecentKeywordPage>
}
