//
//  SignUpCoordinating.swift
//  SignUpInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core

public protocol SignUpCoordinatorDelegate: AnyObject {
    func detachSignUp(_ coordinator: Coordinator)
    
}
public protocol SignUpCoordinating: Coordinator {
    var delegate: SignUpCoordinatorDelegate? { get set }
    
    func homeFlow()
}
