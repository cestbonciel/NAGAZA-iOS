//
//  MyPageBuilder.swift
//  MyPageInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import MyPageInterface

public final class MyPageBuilder: MyPageBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> MyPageCoordinating {
        
        let coordinator = MyPageCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
