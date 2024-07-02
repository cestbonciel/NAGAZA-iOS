//
//  AuthCoordinator.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import AuthInterface

public final class AuthCoordinator: BaseCoordinator, AuthCoordinating {
//    @Injected var homeUseCase: HomeUseCase
    
    public weak var delegate: AuthCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = AuthViewModel()
        //        viewModel.delegate = self
        
        let viewController = AuthViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
