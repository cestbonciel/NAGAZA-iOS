//
//  MapSearchCoordinating.swift
//  MapInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MapSearchCoordinatorDelegate: AnyObject {
  func test(_ coordinator: Coordinator)

}
public protocol MapSearchCoordinating: Coordinator {
  var delegate: MapSearchCoordinatorDelegate? { get set }

  func homeFlow()
}
