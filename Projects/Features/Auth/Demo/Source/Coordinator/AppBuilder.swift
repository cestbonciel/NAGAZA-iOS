//
//  AppBuilder.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import DSKit

import HomeInterface
import Home

public protocol AppRootBuildable {
  func build() -> LaunchCoordinating
}

public final class AppRootBuilder: AppRootBuildable {
  public init() { }

  lazy var homeBuildable: HomeBuildable = {
    HomeBuilder()
  }()

  public func build() -> LaunchCoordinating {

    let viewController = NavigationViewControllable(rootViewControllable: TFLaunchViewController())

    let coordinator = AppCoordinator(
      viewControllable: viewController,
      homeBuildable: self.homeBuildable
    )
    return coordinator
  }
}

