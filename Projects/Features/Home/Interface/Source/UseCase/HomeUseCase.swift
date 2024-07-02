//
//  HomeUseCase.swift
//  Nagaza
//
//  Created by SeungMin on 1/6/24.
//
//
import RxSwift

import Domain

public protocol HomeUseCaseProtocol: AnyObject {
    func fetchCafesList() -> Single<CafesPage>
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage>
}

public final class HomeUseCase: HomeUseCaseProtocol {
    private let roomsRepository: HomeRepositoryProtocol
    
    public init(roomsRepository: HomeRepositoryProtocol) {
        self.roomsRepository = roomsRepository
    }
    
    public func fetchCafesList() -> Single<CafesPage> {
        return roomsRepository.fetchCafesList()
    }
    
    public func fetchRoomsList(cafeId: Int) -> Single<RoomsPage> {
        return roomsRepository.fetchRoomsList(cafeId: cafeId)
    }
}
