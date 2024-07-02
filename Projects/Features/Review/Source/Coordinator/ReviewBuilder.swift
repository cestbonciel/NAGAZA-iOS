//
//  ReviewBuilder.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//

import Core
import ReviewInterface

public final class ReviewBuilder: ReviewBuildable {
    public init() { }
    public func build(rootViewControllable: ViewControllable) -> ReviewCoordinating {
        
        let coordinator = ReviewCoordinator(viewControllable: rootViewControllable)
        
        return coordinator
    }
}
