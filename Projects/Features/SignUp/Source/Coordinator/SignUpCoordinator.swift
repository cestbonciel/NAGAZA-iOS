//
//  SignUpCoordinator.swift
//  SignUpInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import SignUpInterface

public final class SignUpCoordinator: BaseCoordinator, SignUpCoordinating {
//    @Injected var homeUseCase: HomeUseCase
    
    public weak var delegate: SignUpCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = SignUpViewModel()
        //        viewModel.delegate = self
        
        let viewController = SignUpViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
