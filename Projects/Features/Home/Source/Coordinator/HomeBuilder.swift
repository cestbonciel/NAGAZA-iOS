//
//  HomeBuilder.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import HomeInterface

public final class HomeBuilder: HomeBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> HomeCoordinating {
        
        let coordinator = HomeCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
