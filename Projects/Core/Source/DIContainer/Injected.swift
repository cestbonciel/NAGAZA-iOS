//
//  Injected.swift
//  Nagaza
//
//  Created by SeungMin on 4/30/24.
//

import Foundation

@propertyWrapper
public class Injected<T> {
    public let wrappedValue: T
    
    public init() {
        self.wrappedValue = DIContainer.shared.resolve()
    }
}
