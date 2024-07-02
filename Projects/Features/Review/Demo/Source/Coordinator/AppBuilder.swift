//
//  AppBuilder.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import DSKit

import ReviewInterface
import Review

public protocol AppRootBuildable {
    func build() -> LaunchCoordinating
}

public final class AppRootBuilder: AppRootBuildable {
    public init() { }
    
    lazy var reviewBuildable: ReviewBuildable = {
        ReviewBuilder()
    }()
    
    public func build() -> LaunchCoordinating {
        let splashViewController = NagazaSplashViewController()
        let viewController = NavigationViewControllable(rootViewControllable: splashViewController)
        
        let coordinator = AppCoordinator(
            viewControllable: viewController,
            reviewBuildable: self.reviewBuildable
        )
        return coordinator
    }
}

