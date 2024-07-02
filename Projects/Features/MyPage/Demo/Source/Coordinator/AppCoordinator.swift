//
//  AppCoordinator.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import MyPageInterface

protocol AppCoordinating {
    func homeFlow()
}

final class AppCoordinator: LaunchCoordinator, AppCoordinating {
    private let myPageBuildable: MyPageBuildable
    
    init(
        viewControllable: ViewControllable,
        myPageBuildable: MyPageBuildable
    ) {
        self.myPageBuildable = myPageBuildable
        super.init(viewControllable: viewControllable)
    }
    
    public override func start() {
        homeFlow()
    }
    
    // MARK: - public
    func homeFlow() {
        let rootViewControllable = NavigationViewControllable()
        replaceWindowRootViewController(rootViewController: rootViewControllable)
        
        let myPageCoordinator = self.myPageBuildable.build(rootViewControllable: rootViewControllable)
        
        attachChild(myPageCoordinator)
        myPageCoordinator.delegate = self
        
        myPageCoordinator.start()
    }
}

extension AppCoordinator: MyPageCoordinatorDelegate {
    func test(_ coordinator: Core.Coordinator) {
        detachChild(coordinator)
        
        NagazaLogger.dataLogger.debug("test")
    }
}
