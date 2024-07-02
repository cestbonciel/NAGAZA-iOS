//
//  HomeBuilder.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol HomeBuildable {
    func build(rootViewControllable: ViewControllable) -> HomeCoordinating
}
