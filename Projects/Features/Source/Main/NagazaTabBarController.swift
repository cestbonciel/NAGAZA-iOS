//
//  NagazaTabBarController.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

import Core
import DSKit

protocol TabBarDelegate: AnyObject {
    func shouldHideTabBar(_ hide: Bool)
}

final class NagazaTabBarController: UITabBarController, MainViewControllable {
    var uiViewController: UIViewController { self }
    let tabBarHeight: CGFloat = 56
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NagazaLogger.ui.debug("\(#function) \(type(of: self))")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NagazaLogger.ui.debug("\(#function) \(type(of: self))")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = tabBarHeight + UIWindow.safeAreaInsetBottom
        tabBar.frame.origin.y = self.view.frame.height - tabBar.frame.size.height
    }
    
    func setViewController(_ viewControllables: [ViewControllable]) {
        super.setViewControllers(viewControllables.map { $0.uiViewController }, animated: false)
        setAppearance()
    }
    
    private func setAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = DSKitAsset.Colors.white.color
        tabBarAppearance.shadowColor = DSKitAsset.Colors.white.color
        self.tabBar.isTranslucent = false
        
        setTabItemAppearence(tabBarAppearance.stackedLayoutAppearance)
        self.tabBar.standardAppearance = tabBarAppearance
        self.tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func setTabItemAppearence(_ itemAppearance: UITabBarItemAppearance) {
        itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: DSKitAsset.Colors.gray5.color,
            .font: DSKitFontFamily.Pretendard.medium.font(size: 9)
        ]
        itemAppearance.selected.titleTextAttributes = [
            .foregroundColor: DSKitAsset.Colors.gray3.color,
            .font: DSKitFontFamily.Pretendard.medium.font(size: 9)
        ]
    }
}

extension UITabBarItem {
    enum TabItem {
        case home
        case map
        case review
        case myPage
        
        var title: String {
            switch self {
            case .home:
                return "홈"
            case .map:
                return "지도"
            case .review:
                return "리뷰"
            case .myPage:
                return "마이"
            }
        }
        
        var image: DSKitImages {
            switch self {
            case .home:
                return DSKitAsset.Images.icHomeGray
            case .map:
                return DSKitAsset.Images.icMapGray
            case .review:
                return DSKitAsset.Images.icPenGray
            case .myPage:
                return DSKitAsset.Images.icPersonGray
            }
        }
        
        var selectedImage: DSKitImages {
            switch self {
            case .home:
                return DSKitAsset.Images.icHomeOrange
            case .map:
                return DSKitAsset.Images.icMarkOrange
            case .review:
                return DSKitAsset.Images.icPenOrange
            case .myPage:
                return DSKitAsset.Images.icPersonOrange
            }
        }
    }
    
    static func makeTabItem(_ item: TabItem) -> UITabBarItem {
        return UITabBarItem(
            title: item.title,
            image: item.image.image,
            selectedImage: item.selectedImage.image.withRenderingMode(.alwaysOriginal)
        )
    }
}
