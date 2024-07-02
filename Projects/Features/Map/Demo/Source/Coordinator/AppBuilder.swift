//
//  AppBuilder.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import DSKit

import Map
import MapInterface

public protocol AppRootBuildable {
  func build() -> LaunchCoordinating
}

public final class AppRootBuilder: AppRootBuildable {
  public init() { }

  lazy var mapBuildable: MapBuildable = {
    MapBuilder()
  }()

  public func build() -> LaunchCoordinating {
      let splashViewController = NagazaSplashViewController()
      let viewController = NavigationViewControllable(rootViewControllable: splashViewController)

    let coordinator = AppCoordinator(
      viewControllable: viewController,
      mapBuildable: self.mapBuildable
    )
    return coordinator
  }
}

