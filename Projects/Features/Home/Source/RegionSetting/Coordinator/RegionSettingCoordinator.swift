//
//  RegionSettingCoordinator.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import HomeInterface

public final class RegionSettingCoordinator: BaseCoordinator, RegionSettingCoordinating {
    @Injected var regionSettingUseCase: RegionSettingUseCaseProtocol
    
    public weak var delegate: RegionSettingCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = RegionSettingViewModel(regionSettingUseCase: regionSettingUseCase)
        //        viewModel.delegate = self
        
        let viewController = RegionSettingViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
