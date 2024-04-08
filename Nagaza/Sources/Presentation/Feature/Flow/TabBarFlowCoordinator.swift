//
//  TabBarFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

final class TabBarFlowCoordinator: BaseCoordinator {
    
    private var tabBarVC: NagazaTabBarController!
    
    init(
        navigationController: UINavigationController,
        tabBarController: NagazaTabBarController
    ) {
        super.init(navigationController: navigationController)
        self.tabBarVC = tabBarController
    }
    
    override func start() {
        tabBarVC.selectedIndex = 0
        
        navigationController.pushViewController(tabBarVC, animated: false)
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    func setupTabs(with coordinators: [Coordinator]) {
        
        let tabs: [TabBarType] = TabBarType.allCases
        
        for coordinator in coordinators {
            coordinator.start()
            childCoordinators.append(coordinator)
        }
        
        let viewControllers = coordinators.map { $0.navigationController }

        tabBarVC.setViewControllers(viewControllers, with: tabs)
    }
}

// MARK: Logout 버튼 클릭 시 tabBar Flow Coordinator도 같이 삭제
extension TabBarFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        navigationController.popViewController(animated: true)
        removeChildCoordinator(childCoordinator)
    }
}
