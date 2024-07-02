//
//  AuthCoordinating.swift
//  AuthInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol AuthCoordinatorDelegate: AnyObject {
  func test(_ coordinator: Coordinator)

}
public protocol AuthCoordinating: Coordinator {
  var delegate: AuthCoordinatorDelegate? { get set }

  func homeFlow()
}
