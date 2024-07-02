//
//  Coordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

public protocol Coordinator: AnyObject {
    var viewControllable: ViewControllable { get }
    var childCoordinators: [Coordinator] { get set }
    var finishDelegate: CoordinatorFinishDelegate? { get set }
    
    func start()
    func attachChild(_ child: Coordinator)
    func detachChild(_ child: Coordinator)
    func detachChilds()
}

public protocol CoordinatorFinishDelegate: AnyObject {
    func coordinatorDidFinish(childCoordinator: Coordinator)
}
