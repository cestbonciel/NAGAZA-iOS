//
//  AppCoordinator.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import SignUpInterface

protocol AppCoordinating {
    func homeFlow()
}

final class AppCoordinator: LaunchCoordinator, AppCoordinating {
    
    private let signUpBuildable: SignUpBuildable
    
    init(
        viewControllable: ViewControllable,
        signUpBuildable: SignUpBuildable
    ) {
        self.signUpBuildable = signUpBuildable
        super.init(viewControllable: viewControllable)
    }
    
    public override func start() {
        homeFlow()
    }
    
    // MARK: - public
    func homeFlow() {
        let rootViewControllable = NavigationViewControllable()
        replaceWindowRootViewController(rootViewController: rootViewControllable)
        
        let signUpCoordinator = self.signUpBuildable.build()
        
        attachChild(signUpCoordinator)
        signUpCoordinator.delegate = self
        
        signUpCoordinator.start()
    }
}

extension AppCoordinator: SignUpCoordinatorDelegate {
    func detachSignUp(_ coordinator: Core.Coordinator) {
        detachChild(coordinator)
        
        NagazaLogger.dataLogger.debug("test")
    }
}
