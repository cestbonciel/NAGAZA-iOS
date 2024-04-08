//
//  AppFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/19.
//

import UIKit

final class AppFlowCoordinator: BaseCoordinator {
    
    private let appDIContainer: AppDIContainer
    
    init(
        navigationController: UINavigationController,
        appDIContainer: AppDIContainer
    ) {
        self.appDIContainer = appDIContainer
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let splashViewController = SplashViewController()
        navigationController.pushViewController(splashViewController, animated: false)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            if let _ = Keychain.shared.get(.accessToken) {
                self?.showTabBar()
            } else {
                self?.showLogin()
            }
        }
    }
}

extension AppFlowCoordinator {
    func showTabBar() {
        let tabBarController = NagazaTabBarController()
        let tabBarFlowCoordinator = TabBarFlowCoordinator(
            navigationController: navigationController,
            tabBarController: tabBarController
        )
        
        let HomeSceneDIContaier = appDIContainer.makeHomeSceneDIContainer()
        let HomeFlow = HomeSceneDIContaier.makeHomeFlowCoordinator(
            navigationController: UINavigationController()
        )
        
        let mapSceneDIContaier = appDIContainer.makeMapSceneDIContainer()
        let mapFlow = mapSceneDIContaier.makeMapFlowCoordinator(
            navigationController: UINavigationController()
        )
        
        let reviewSceneDIContaier = appDIContainer.makeReviewSceneDIContainer()
        let reviewFlow = reviewSceneDIContaier.makeReviewFlowCoordinator(
            navigationController: UINavigationController()
        )
        
        let myPageSceneDIContaier = appDIContainer.makeMyPageSceneDIContainer()
        let myPageFlow = myPageSceneDIContaier.makeMyPageFlowCoordinator(
            navigationController: UINavigationController()
        )
      
        tabBarFlowCoordinator.setupTabs(with: [
            HomeFlow,
            mapFlow,
            reviewFlow,
            myPageFlow
        ])
        
        tabBarFlowCoordinator.finishDelegate = self
        tabBarFlowCoordinator.start()
        
        childCoordinators.append(tabBarFlowCoordinator)
    }
    
    private func showLogin() {
        let loginSceneDIContainer = appDIContainer.makeLoginSceneDIContainer()
        let loginFlow = loginSceneDIContainer.makeLoginFlowCoordinator(
            navigationController: navigationController
        )
        
        loginFlow.finishDelegate = self
        loginFlow.start()
        
        childCoordinators.append(loginFlow)
    }
}

extension AppFlowCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: Coordinator) {
        if childCoordinator is TabBarFlowCoordinator {
            navigationController.viewControllers.removeAll()
            
            // TODO: 토큰 삭제
            Keychain.shared.delete(.accessToken)
            
            showLogin()
        } else {
            navigationController.viewControllers.removeAll()
            
            // TODO: 토큰 임시 설정
            Keychain.shared.set("test", forKey: .accessToken)
            
            showTabBar()
        }
    }
}
