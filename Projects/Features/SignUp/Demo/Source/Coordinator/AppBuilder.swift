//
//  AppBuilder.swift
//  SignUpInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import DSKit

import SignUp
import SignUpInterface

public protocol AppRootBuildable {
    func build() -> LaunchCoordinating
}

public final class AppRootBuilder: AppRootBuildable {
    public init() { }
    
    lazy var signUpBuildable: SignUpBuildable = {
        SignUpBuilder()
    }()
    
    public func build() -> LaunchCoordinating {
        let splashViewController = NagazaSplashViewController()
        let viewController = NavigationViewControllable(rootViewControllable: splashViewController)
        
        let coordinator = AppCoordinator(
            viewControllable: viewController,
            signUpBuildable: self.signUpBuildable
        )
        return coordinator
    }
}

