//
//  MainCoordinating.swift
//  Feature
//
//  Created by SeungMin on 5/22/24.
//

import Foundation

import Core

import Home
import HomeInterface

import Map
import MapInterface

import Review
import ReviewInterface

import MyPage
import MyPageInterface

protocol MainViewControllable: ViewControllable {
    func setViewController(_ viewControllables: [ViewControllable])
}

final class MainCoordinator: BaseCoordinator, MainCoordinating {
    
    public weak var delegate: MainCoordinatorDelegate?
    private let mainViewControllable: MainViewControllable
    private let homeBuildable: HomeBuildable
    private let mapBuildable: MapBuildable
    private let reviewBuildable: ReviewBuildable
    private let myPageBuildable: MyPageBuildable
    
    init(
        viewControllable: MainViewControllable,
        homeBuildable: HomeBuildable,
        mapBuildable: MapBuildable,
        reviewBuildable: ReviewBuildable,
        myPageBuildable: MyPageBuildable
    ) {
        self.mainViewControllable = viewControllable
        self.homeBuildable = homeBuildable
        self.mapBuildable = mapBuildable
        self.reviewBuildable = reviewBuildable
        self.myPageBuildable = myPageBuildable
        
        super.init(viewControllable: self.mainViewControllable)
    }
    
    override func start() {
        replaceWindowRootViewController(rootViewController: mainViewControllable)
        attachTab()
    }
    
    func attachTab() {
        let homeCoordinator = homeBuildable.build(rootViewControllable: NavigationViewControllable())
        attachChild(homeCoordinator)
        homeCoordinator.viewControllable.uiViewController.tabBarItem = .makeTabItem(.home)
        homeCoordinator.delegate = self
        homeCoordinator.start()
        
        let mapCoordinator = mapBuildable.build(rootViewControllable: NavigationViewControllable())
        attachChild(mapCoordinator)
        mapCoordinator.viewControllable.uiViewController.tabBarItem = .makeTabItem(.map)
        mapCoordinator.delegate = self
        mapCoordinator.start()
        
        let reviewCoordinator = reviewBuildable.build(rootViewControllable: NavigationViewControllable())
        attachChild(reviewCoordinator)
        reviewCoordinator.viewControllable.uiViewController.tabBarItem = .makeTabItem(.review)
        reviewCoordinator.delegate = self
        reviewCoordinator.start()
        
        let myPageCoordinator = myPageBuildable.build(rootViewControllable: NavigationViewControllable())
        attachChild(myPageCoordinator)
        myPageCoordinator.viewControllable.uiViewController.tabBarItem = .makeTabItem(.myPage)
        myPageCoordinator.delegate = self
        myPageCoordinator.start()
        
        let viewControllables = [
            homeCoordinator.viewControllable,
            mapCoordinator.viewControllable,
            reviewCoordinator.viewControllable,
            myPageCoordinator.viewControllable
        ]
        
        self.mainViewControllable.setViewController(viewControllables)
    }
    
    func detachTab() {
        self.childCoordinators.forEach { child in
            child.viewControllable.setViewControllers([])
            detachChild(child)
        }
        delegate?.detachTab(self)
    }
}

extension MainCoordinator: HomeCoordinatorDelegate, MapCoordinatorDelegate, ReviewCoordinatorDelegate, MyPageCoordinatorDelegate {
    func test(_ coordinator: Core.Coordinator) {
        detachTab()
    }
}
