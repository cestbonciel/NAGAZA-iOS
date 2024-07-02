//
//  AppSettingCoordinating.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol AppSettingCoordinatorDelegate: AnyObject {
    func test(_ coordinator: Coordinator)
    
}
public protocol AppSettingCoordinating: Coordinator {
    var delegate: AppSettingCoordinatorDelegate? { get set }
    
    func homeFlow()
}
