//
//  AuthBuilder.swift
//  HomeInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import AuthInterface

public final class AuthBuilder: AuthBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> AuthCoordinating {
        
        let coordinator = AuthCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
