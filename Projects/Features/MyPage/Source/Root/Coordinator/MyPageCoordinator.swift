//
//  MyPageCoordinator.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MyPageInterface

public final class MyPageCoordinator: BaseCoordinator, MyPageCoordinating {
//    @Injected var homeUseCase: HomeUseCaseProtocol
    
    public weak var delegate: MyPageCoordinatorDelegate?
    
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
