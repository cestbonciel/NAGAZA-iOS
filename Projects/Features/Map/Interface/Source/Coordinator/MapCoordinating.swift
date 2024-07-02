//
//  MapCoordinating.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MapCoordinatorDelegate: AnyObject {
  func test(_ coordinator: Coordinator)

}
public protocol MapCoordinating: Coordinator {
  var delegate: MapCoordinatorDelegate? { get set }

  func homeFlow()
}
