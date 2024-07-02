//
//  HomeRepository.swift
//  Nagaza
//
//  Created by SeungMin on 1/6/24.
//

import RxSwift
import Domain

public protocol HomeRepositoryProtocol: AnyObject {
    func fetchCafesList() -> Single<CafesPage>
    func fetchRoomsList(cafeId: Int) -> Single<RoomsPage>
}
