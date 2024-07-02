//
//  MapViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import RxSwift
import RxCocoa
import MapInterface
import Core
import Domain

//struct MapViewModelActions {
//    var toMapSearchVC: () -> Void
//}

protocol MapCoordinatorActions: CoordinatorActions {
    func mapSearchFlow()
}

final class MapViewModel: NagazaViewModel {
    private let mapUseCase: MapUseCaseProtocol
    weak var actions: MapCoordinatorActions?
    
    let searchItem = PublishRelay<Place?>()
    
    struct Input {
        let searchViewTapTrigger: Driver<Void>
    }
    
    struct Output {
        let mapSearch: Driver<Void>
        let searchItem: Driver<Place?>
    }
    
    init(mapUseCase: MapUseCaseProtocol) {
        self.mapUseCase = mapUseCase
    }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? MapCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        let mapSearch = input.searchViewTapTrigger
            .do { [weak self] _ in
                guard let self = self else { return }
                self.mapSearchFlow()
            }
            .asDriver()
        
        return Output(
            mapSearch: mapSearch,
            searchItem: searchItem.asDriverOnErrorJustEmpty()
        )
    }
}

extension MapViewModel {
    private func mapSearchFlow() {
        actions?.mapSearchFlow()
    }
}
