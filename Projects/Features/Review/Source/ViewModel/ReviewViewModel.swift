//
//  ReviewViewModel.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/10/20.
//

import Foundation

import Core

protocol ReviewCoordinatorActions: CoordinatorActions {
    
}

final class ReviewViewModel: NagazaViewModel {
    private weak var actions: ReviewCoordinatorActions?
    
    struct Input {
        
    }
    
    struct Output {
        
    }
    
    // 의존성 주입
    init() { }
    
    func setCoordinatorActions(with actions: CoordinatorActions) {
        self.actions = actions as? ReviewCoordinatorActions
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
}
