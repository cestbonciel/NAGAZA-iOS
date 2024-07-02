//
//  DefaultHomeRepository.swift
//  Nagaza
//
//  Created by SeungMin on 1/7/24.
//

import HomeInterface
import Networks
import Domain
import RxSwift
import RxMoya
import Moya

public final class HomeRepository: ProviderProtocol, HomeRepositoryProtocol {
    public typealias Target = HomeTarget
    public var provider: MoyaProvider<Target>
    
    public init(isStub: Bool, sampleStatusCode: Int, customEndpointClosure: ((Target) -> Moya.Endpoint)?) {
        self.provider = Self.consProvider(isStub, sampleStatusCode, customEndpointClosure)
    }
    
    public func fetchCafesList() -> Single<CafesPage> {
        request(
            type: CafeResponse.self,
            target: .fetchCafesList
        )
        .map { $0.toDomain() }
    }
    
    public func fetchRoomsList(cafeId: Int) -> Single<RoomsPage> {
        request(
            type: RoomsResponse.self,
            target: .fetchRoomsList(cafeId: cafeId)
        )
        .map { $0.toDomain() }
    }
}
