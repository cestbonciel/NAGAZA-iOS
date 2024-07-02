//
//  AppBuilder.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import DSKit

import MyPageInterface
import MyPage

public protocol AppRootBuildable {
    func build() -> LaunchCoordinating
}

public final class AppRootBuilder: AppRootBuildable {
    public init() { }
    
    lazy var myPageBuildable: MyPageBuildable = {
        MyPageBuilder()
    }()
    
    public func build() -> LaunchCoordinating {
        let splashViewController = NagazaSplashViewController()
        let viewController = NavigationViewControllable(rootViewControllable: splashViewController)
        
        let coordinator = AppCoordinator(
            viewControllable: viewController,
            myPageBuildable: self.myPageBuildable
        )
        return coordinator
    }
}

