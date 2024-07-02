//
//  UIWindow+Util.swift
//  Core
//
//  Created by SeungMin on 6/12/24.
//

import UIKit

public extension UIWindow {
    static var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .last
    }
    
    static var safeAreaInsetBottom: CGFloat {
        return (UIWindow.keyWindow?.safeAreaInsets.bottom ?? 0)
    }
}
