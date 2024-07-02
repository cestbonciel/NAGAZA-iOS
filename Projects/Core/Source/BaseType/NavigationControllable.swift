//
//  NavigationControllable.swift
//  Nagaza
//
//  Created by SeungMin on 5/15/24.
//

import UIKit

public final class NavigationViewControllable: ViewControllable {
    public var uiViewController: UIViewController { self.navigationController }
    public let navigationController: UINavigationController
    
    public init(rootViewControllable: ViewControllable) {
        let navigationController = UINavigationController(rootViewController: rootViewControllable.uiViewController )
        
        self.navigationController = navigationController
    }
    
    public init() {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
    }
}
