//
//  MyPageFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol MyPageFlowCoordinatorDependencies {
    func makeMyPageViewController(actions: MyPageViewModelActions) -> MyPageViewController
}

final class MyPageFlowCoordinator: BaseCoordinator {
    private let dependencies: MyPageFlowCoordinatorDependencies!
    
    private weak var myPageVC: MyPageViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: MyPageFlowCoordinatorDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = MyPageViewModelActions(moveAppSetting: moveAppSetting)
        let vc = dependencies.makeMyPageViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(vc, animated: false)
        
        myPageVC = vc
    }
}

extension MyPageFlowCoordinator {
    func moveAppSetting() {
        let coordinator = MyPageAppSettingCoordinator(navigationController: navigationController,
                                                      dependencies: dependencies)
        coordinator.start()
        navigationController.pushViewController(coordinator.viewController,
                                                animated: true)
        childCoordinators.append(coordinator)
    }
}
