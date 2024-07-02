//
//  RegionSettingBuildable.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol RegionSettingBuildable {
    func build(rootViewControllable: ViewControllable) -> RegionSettingCoordinating
}
