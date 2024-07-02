//
//  LaunchCoordinator.swift
//  Nagaza
//
//  Created by SeungMin on 5/15/24.
//

import UIKit

public protocol LaunchCoordinating {
  func launch(window: UIWindow)
}

public protocol URLHandling {
  func handle(_ url: URL)
}

open class LaunchCoordinator: BaseCoordinator, LaunchCoordinating {
  public func launch(window: UIWindow) {
    window.rootViewController = self.viewControllable.uiViewController
    window.makeKeyAndVisible()

    NagazaLogger.domain.debug("AppCoordinator 1초 async")
      
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.start()
    }
  }
}
