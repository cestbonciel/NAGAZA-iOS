//
//  BaseCoordinator.swift
//  Nagaza
//
//  Created by 강조은 on 4/7/24.
//

import UIKit

open class BaseCoordinator: Coordinator {
    public let viewControllable: ViewControllable
    public var childCoordinators: [Coordinator]
    weak public var finishDelegate: CoordinatorFinishDelegate?
    public init(viewControllable: ViewControllable) {
      self.viewControllable = viewControllable
      self.childCoordinators = []

      NagazaLogger.cycle(name: self)
    }
    
    deinit { NagazaLogger.cycle(name: self) }

    open func start() { }
    
    public func attachChild(_ coordinator: Coordinator) {
        if !childCoordinators.contains(where: { $0 === coordinator }) {
            childCoordinators.append(coordinator)
        }
    }
    
    public func detachChild(_ coordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { $0 === coordinator }) {
            childCoordinators.remove(at: index)
        }
    }
    
    public func detachChilds() {
        childCoordinators.forEach { $0.detachChilds() }
        childCoordinators.removeAll()
    }
    
    public func replaceWindowRootViewController(rootViewController: ViewControllable) {
      let keyWindow = UIWindow.keyWindow
      keyWindow?.rootViewController = rootViewController.uiViewController
      keyWindow?.makeKeyAndVisible()
    }
}
