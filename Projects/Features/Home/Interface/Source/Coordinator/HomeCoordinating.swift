//
//  HomeCoordinating.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol HomeCoordinatorDelegate: AnyObject {
    func test(_ coordinator: Coordinator)
    
}
public protocol HomeCoordinating: Coordinator {
    var delegate: HomeCoordinatorDelegate? { get set }
    
    func homeFlow()
}
