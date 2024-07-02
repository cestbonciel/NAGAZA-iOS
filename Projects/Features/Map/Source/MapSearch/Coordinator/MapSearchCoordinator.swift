//
//  MapSearchCoordinator.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MapInterface

public final class MapSearchCoordinator: BaseCoordinator, MapSearchCoordinating {
    @Injected var mapUseCase: MapUseCaseProtocol
    
    public weak var delegate: MapSearchCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = MapSearchViewModel(mapUseCase: mapUseCase)
        //        viewModel.delegate = self
        
        let viewController = MapSearchViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
