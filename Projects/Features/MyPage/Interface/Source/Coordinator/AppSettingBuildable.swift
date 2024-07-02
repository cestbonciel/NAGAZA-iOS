//
//  AppSettingBuildable.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol AppSettingBuildable {
    func build(rootViewControllable: ViewControllable) -> AppSettingCoordinating
}
