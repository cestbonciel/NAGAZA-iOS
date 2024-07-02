//
//  MapSearchBuilder.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MapInterface

public final class MapSearchBuilder: MapSearchBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> MapSearchCoordinating {
        
        let coordinator = MapSearchCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
