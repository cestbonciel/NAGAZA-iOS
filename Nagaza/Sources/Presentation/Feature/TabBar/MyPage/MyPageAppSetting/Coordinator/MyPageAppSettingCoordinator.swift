//
//  MyPageAppSettingCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 3/23/24.
//

import UIKit

final class MyPageAppSettingCoordinator: BaseCoordinator {
    private var dependencies: MyPageFlowCoordinatorDependencies!
    
    init(
        navigationController: UINavigationController,
        dependencies: MyPageFlowCoordinatorDependencies
    ) {
        super.init(navigationController: navigationController)
        self.dependencies = dependencies
    }
    
    override func start() {
        viewController = MyPageAppSettingViewController()
    }
}
