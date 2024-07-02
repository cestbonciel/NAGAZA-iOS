//
//  RegionSettingCoordinating.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol RegionSettingCoordinatorDelegate: AnyObject {
    func test(_ coordinator: Coordinator)
    
}
public protocol RegionSettingCoordinating: Coordinator {
    var delegate: RegionSettingCoordinatorDelegate? { get set }
    
    func homeFlow()
}
