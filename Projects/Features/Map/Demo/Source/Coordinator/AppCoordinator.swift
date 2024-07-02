//
//  AppCoordinator.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import UIKit

import Core
import MapInterface

protocol AppCoordinating {
  func homeFlow()
}

final class AppCoordinator: LaunchCoordinator, AppCoordinating {
  private let mapBuildable: MapBuildable
  
  init(
    viewControllable: ViewControllable,
    mapBuildable: MapBuildable
  ) {
    self.mapBuildable = mapBuildable
    super.init(viewControllable: viewControllable)
  }
  
  public override func start() {
    homeFlow()
  }
  
  // MARK: - public
  func homeFlow() {
    let rootViewControllable = NavigationViewControllable()
    replaceWindowRootViewController(rootViewController: rootViewControllable)
    
    let mapCoordinator = self.mapBuildable.build(rootViewControllable: rootViewControllable)
    
    attachChild(mapCoordinator)
    mapCoordinator.delegate = self
    
    mapCoordinator.start()
  }
}

extension AppCoordinator: MapCoordinatorDelegate {
  func test(_ coordinator: Core.Coordinator) {
    detachChild(coordinator)
    
    NagazaLogger.dataLogger.debug("test")
  }
}
