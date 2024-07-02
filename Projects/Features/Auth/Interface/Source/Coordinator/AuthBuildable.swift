//
//  AuthBuilder.swift
//  AuthInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol AuthBuildable {
  func build(rootViewControllable: ViewControllable) -> AuthCoordinating
}
