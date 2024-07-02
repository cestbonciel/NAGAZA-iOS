//
//  MainBuilder.swift
//  Feature
//
//  Created by SeungMin on 5/22/24.
//

import Core

import Home
import HomeInterface

import Map
import MapInterface

import Review
import ReviewInterface

import MyPage
import MyPageInterface

final class MainBuilder: MainBuildable {
    func build() -> MainCoordinating {
        let tabBar = NagazaTabBarController()
        let homeBuilder = HomeBuilder()
        let mapBuilder = MapBuilder()
        let reviewBuilder = ReviewBuilder()
        let myPageBuilder = MyPageBuilder()
        
        let coordinator = MainCoordinator(
            viewControllable: tabBar,
            homeBuildable: homeBuilder,
            mapBuildable: mapBuilder,
            reviewBuildable: reviewBuilder,
            myPageBuildable: myPageBuilder
        )
        
        return coordinator
    }
}

