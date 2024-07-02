//
//  MainCoordinating.swift
//  Feature
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MainCoordinatorDelegate: AnyObject {
    func detachTab(_ coordinator: Coordinator)
}

protocol MainCoordinating: Coordinator {
    var delegate: MainCoordinatorDelegate? { get set }
    
    func attachTab()
    func detachTab()
}
