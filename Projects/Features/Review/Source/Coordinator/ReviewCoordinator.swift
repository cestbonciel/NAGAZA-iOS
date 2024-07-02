//
//  ReviewCoordinator.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import ReviewInterface

public final class ReviewCoordinator: BaseCoordinator, ReviewCoordinating {
//    @Injected var homeUseCase: HomeUseCaseProtocol
    
    public weak var delegate: ReviewCoordinatorDelegate?
    
    public override func start() {
        homeFlow()
    }
    
    public func homeFlow() {
        let viewModel = ReviewViewModel()
        //        viewModel.delegate = self
        
        let viewController = ReviewViewController(viewModel: viewModel)
        
        self.viewControllable.setViewControllers([viewController])
    }
}
