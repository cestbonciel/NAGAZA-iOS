//
//  AppCoordinator.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import ReviewInterface

protocol AppCoordinating {
    func homeFlow()
}

final class AppCoordinator: LaunchCoordinator, AppCoordinating {
    
    private let reviewBuildable: ReviewBuildable
    
    init(
        viewControllable: ViewControllable,
        reviewBuildable: ReviewBuildable
    ) {
        self.reviewBuildable = reviewBuildable
        super.init(viewControllable: viewControllable)
    }
    
    public override func start() {
        homeFlow()
    }
    
    // MARK: - public
    func homeFlow() {
        let rootViewControllable = NavigationViewControllable()
        replaceWindowRootViewController(rootViewController: rootViewControllable)
        
        let reviewCoordinator = self.reviewBuildable.build(rootViewControllable: rootViewControllable)
        
        attachChild(reviewCoordinator)
        reviewCoordinator.delegate = self
        
        reviewCoordinator.start()
    }
}

extension AppCoordinator: ReviewCoordinatorDelegate {
    func test(_ coordinator: Core.Coordinator) {
        detachChild(coordinator)
        
        NagazaLogger.dataLogger.debug("test")
    }
}
