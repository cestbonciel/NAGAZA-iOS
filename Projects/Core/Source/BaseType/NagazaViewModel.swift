//
//  NagazaViewModel.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import Foundation

import RxSwift

public protocol CoordinatorActions: AnyObject { }

public protocol NagazaViewModel {
    associatedtype CoordinatorActions

    associatedtype Input
    associatedtype Output
    
    func setCoordinatorActions(with actions: CoordinatorActions)
    
    func transform(input: Input) -> Output
}
