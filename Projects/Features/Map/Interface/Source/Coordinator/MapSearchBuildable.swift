//
//  MapSearchBuildable.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MapSearchBuildable {
  func build(rootViewControllable: ViewControllable) -> MapSearchCoordinating
}
