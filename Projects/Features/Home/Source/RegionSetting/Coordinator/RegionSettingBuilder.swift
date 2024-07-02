//
//  RegionSettingBuilder.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import HomeInterface

public final class RegionSettingBuilder: RegionSettingBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> RegionSettingCoordinating {
        
        let coordinator = RegionSettingCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
