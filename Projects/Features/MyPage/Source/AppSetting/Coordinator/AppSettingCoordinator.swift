//
//  AppSettingCoordinator.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MyPageInterface

public final class AppSettingCoordinator: BaseCoordinator, AppSettingCoordinating {
//    @Injected var homeUseCase: HomeUseCaseProtocol
    
    public weak var delegate: AppSettingCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = MyPageViewModel()
        //        viewModel.delegate = self
        
        let viewController = MyPageViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
