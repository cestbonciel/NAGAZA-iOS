//
//  AppCoordinator.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import HomeInterface

protocol AppCoordinating {
    func homeFlow()
}

final class AppCoordinator: LaunchCoordinator, AppCoordinating {
    private let homeBuildable: HomeBuildable
    
    init(
        viewControllable: ViewControllable,
        homeBuildable: HomeBuildable
    ) {
        self.homeBuildable = homeBuildable
        super.init(viewControllable: viewControllable)
    }
    
    public override func start() {
        homeFlow()
    }
    
    // MARK: - public
    func homeFlow() {
        let rootViewControllable = NavigationViewControllable()
        replaceWindowRootViewController(rootViewController: rootViewControllable)
        
        let homeCoordinator = self.homeBuildable.build(rootViewControllable: rootViewControllable)
        
        attachChild(homeCoordinator)
        homeCoordinator.delegate = self
        
        homeCoordinator.start()
    }
}

extension AppCoordinator: HomeCoordinatorDelegate {
    func test(_ coordinator: Core.Coordinator) {
        detachChild(coordinator)
        
        NagazaLogger.dataLogger.debug("test")
    }
}
