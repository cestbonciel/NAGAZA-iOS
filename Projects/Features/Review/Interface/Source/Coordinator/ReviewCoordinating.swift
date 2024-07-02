//
//  ReviewCoordinating.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol ReviewCoordinatorDelegate: AnyObject {
  func test(_ coordinator: Coordinator)

}
public protocol ReviewCoordinating: Coordinator {
  var delegate: ReviewCoordinatorDelegate? { get set }

  func homeFlow()
}
