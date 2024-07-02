//
//  MapBuilder.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MapBuildable {
  func build(rootViewControllable: ViewControllable) -> MapCoordinating
}
