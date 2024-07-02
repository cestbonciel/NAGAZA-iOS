//
//  MapBuilder.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MapInterface

public final class MapBuilder: MapBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> MapCoordinating {
        
        let coordinator = MapCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
