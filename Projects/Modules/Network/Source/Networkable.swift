//
//  Networkable.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Moya

public protocol Networkable {
    // TargetType을 준수하는 Generic Type
    associatedtype Target: TargetType
    
    // Factory Pattern 적용
    static func makeProvider() -> MoyaProvider<Target>
}

public extension Networkable {
    static func makeProvider() -> MoyaProvider<Target> {
        let loggerPlugin = NetworkLoggerPlugin()
        return MoyaProvider<Target>(plugins: [loggerPlugin])
    }
    
    static var provider: MoyaProvider<Target> {
        makeProvider()
    }
}


