//
//  HomeCoordinator.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import HomeInterface

public final class HomeCoordinator: BaseCoordinator, HomeCoordinating {
    @Injected var homeUseCase: HomeUseCaseProtocol
    @Injected var regionSettingUseCase: RegionSettingUseCaseProtocol
    
    public weak var delegate: HomeCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = HomeViewModel(homeUseCase: homeUseCase, regionSettingUseCase: regionSettingUseCase)
        //        viewModel.delegate = self
        
        let viewController = HomeViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
