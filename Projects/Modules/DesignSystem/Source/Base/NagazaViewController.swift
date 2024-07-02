//
//  NagazaBaseViewController.swift
//  Nagaza
//
//  Created by SeungMin on 2023/11/01.
//

import UIKit

import RxSwift

open class NagazaViewController: UIViewController, ViewControllable {
    public var disposeBag = DisposeBag()
    
    private var afterViewDidLoad = true
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        NagazaLogger.cycle(name: self)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NagazaLogger.cycle(name: self)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        NagazaLogger.cycle(name: self)
        
        view.backgroundColor = .white
        navigationSetting()
        makeUI()
        bindViewModel()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if afterViewDidLoad {
            afterViewDidLoad.toggle()
            adjustLayoutAfterRendering()
        }
    }
    
//    open func setCoordinatorActions(with actions: CoordinatorActions) { }
    
    /// Set up Navigation Bar
    open func navigationSetting() {
//        navigationController?.navigationBar.tintColor = DSKitAsset.Colors.gray3.color
        
        let backButtonImage = DSKitAsset.Images.icArrowLeftGray.image
//            .withAlignmentRectInsets(.init(top: 0, left: -10, bottom: 0, right: 0))
        
        let backButtonAppearence = UIBarButtonItemAppearance()
        backButtonAppearence.normal.titleTextAttributes = [.foregroundColor: UIColor.clear, .font: UIFont.systemFont(ofSize: 0)]
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            .font: UIFont.ngaH3M,
            .foregroundColor: DSKitAsset.Colors.black.color
        ]
        navBarAppearance.shadowColor = nil
        navBarAppearance.setBackIndicatorImage(backButtonImage, transitionMaskImage: backButtonImage)
        navBarAppearance.backButtonAppearance = backButtonAppearence
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationController?.navigationBar.isTranslucent = false
    }
    
    /// Set up constraints of view and add subviews
    open func makeUI() { }
    
    /// Adjust layout after rendering
    open func adjustLayoutAfterRendering() { }
    
    /// Data binding between view and model
    open func bindViewModel() { }
}
