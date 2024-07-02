//
//  MapRepository.swift
//  Nagaza
//
//  Created by SeungMin on 3/20/24.
//

import MapInterface
import Networks
import Domain
import RxSwift
import Moya

public final class MapRepository: ProviderProtocol {
    public typealias Target = MapSearchTarget
    public var provider: MoyaProvider<Target>
    
    public init(isStub: Bool = false, sampleStatusCode: Int = 200, customEndpointClosure: ((Target) -> Moya.Endpoint)? = nil) {
        provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
    }
}

extension MapRepository: MapRepositoryProtocol {
    public func fetchPlaces(with keyword: String) -> Single<PlacePage> {
        request(
            type: PlaceResponse.self,
            target: .fetchPlacesList(
                request: KeywordSearchRequest(query: keyword)
            )
        )
        .map { $0.toDomain() }
    }
}
