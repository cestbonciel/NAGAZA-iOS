//
//  MyPageCoordinating.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MyPageCoordinatorDelegate: AnyObject {
    func test(_ coordinator: Coordinator)
    
}
public protocol MyPageCoordinating: Coordinator {
    var delegate: MyPageCoordinatorDelegate? { get set }
    
    func homeFlow()
}
