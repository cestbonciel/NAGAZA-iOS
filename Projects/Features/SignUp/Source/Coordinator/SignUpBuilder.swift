//
//  SignUpBuilder.swift
//  SignUpInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import SignUpInterface

public final class SignUpBuilder: SignUpBuildable {
    public init() { }
    public func build() -> SignUpCoordinating {
        let coordinator = SignUpCoordinator(viewControllable: NavigationViewControllable())
        
        return coordinator
    }
}
