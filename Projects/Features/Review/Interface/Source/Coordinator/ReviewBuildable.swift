//
//  ReviewBuildable.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol ReviewBuildable {
  func build(rootViewControllable: ViewControllable) -> ReviewCoordinating
}
