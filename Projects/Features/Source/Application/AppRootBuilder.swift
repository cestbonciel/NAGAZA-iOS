//
//  AppRootBuilder.swift
//  Feature
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
    
    lazy var mainBuildable: MainBuildable = {
        MainBuilder()
    }()
    
    lazy var signUpBuildable: SignUpBuildable = {
        SignUpBuilder()
    }()
    
    public func build() -> LaunchCoordinating {
        let viewController = NagazaSplashViewController()
        
        let coordinator = AppCoordinator(
            viewControllable: viewController,
            mainBuildable: self.mainBuildable,
            signUpBuildable: self.signUpBuildable
        )
        return coordinator
    }
}
