//
//  MyPageBuildable.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol MyPageBuildable {
    func build(rootViewControllable: ViewControllable) -> MyPageCoordinating
}
