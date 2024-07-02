//
//  MapCoordinator.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MapInterface

public final class MapCoordinator: BaseCoordinator, MapCoordinating, MapCoordinatorActions {
    @Injected var mapUseCase: MapUseCaseProtocol
    
    public weak var delegate: MapCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = MapViewModel(mapUseCase: mapUseCase)
        viewModel.actions = self
        
        let viewController = MapViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
    
    public func mapSearchFlow() {
        print("안 탐?ㄱ")
        
        let viewModel = MapSearchViewModel(mapUseCase: mapUseCase)
        //        viewModel.delegate = self
        
        let viewController = MapSearchViewController(viewModel: viewModel)
        
        self.viewControllable.pushViewController(viewController, animated: true)
        
//        self.attachChild(<#T##coordinator: Coordinator##Coordinator#>)
    }
}
