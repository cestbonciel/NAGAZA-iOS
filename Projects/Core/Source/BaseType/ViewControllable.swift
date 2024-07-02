//
//  ViewControllable.swift
//  Nagaza
//
//  Created by SeungMin on 5/15/24.
//

import UIKit

public protocol ViewControllable {
    var uiViewController: UIViewController { get }
}

public extension ViewControllable where Self: UIViewController {
    var uiViewController: UIViewController { self }
}

public extension ViewControllable {
    func setViewControllers(_ viewControllerables: [ViewControllable]) {
        if let nav = self.uiViewController as? UINavigationController {
            nav.setViewControllers(viewControllerables.map(\.uiViewController), animated: true)
        } else {
            self.uiViewController.navigationController?.setViewControllers(viewControllerables.map(\.uiViewController), animated: true)
        }
    }
    
    func pushViewController(_ viewControllable: ViewControllable, animated: Bool) {
        if let nav = self.uiViewController as? UINavigationController {
            nav.pushViewController(viewControllable.uiViewController, animated: animated)
        } else {
            self.uiViewController.navigationController?.pushViewController(viewControllable.uiViewController, animated: animated)
        }
    }
    
    func popViewController(animated: Bool) {
        if let nav = self.uiViewController as? UINavigationController {
            nav.popViewController(animated: animated)
        } else {
            self.uiViewController.navigationController?.popViewController(animated: animated)
        }
    }
    
    func present(_ viewControllable: ViewControllable, animated: Bool, completion: (() -> Void)?) {
        self.uiViewController.present(viewControllable.uiViewController, animated: animated, completion: completion)
    }
    
    func dismiss(completion: (() -> Void)?) {
        self.uiViewController.dismiss(animated: true, completion: completion)
    }
    
    var topViewControllable: ViewControllable {
        var top: ViewControllable = self
        
        while let presented = top.uiViewController.presentedViewController as? ViewControllable {
            top = presented
        }
        
        return top
    }
}
