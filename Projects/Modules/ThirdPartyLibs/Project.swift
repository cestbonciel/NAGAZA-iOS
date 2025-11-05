//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import NAGAZAIOS

let project = Project.dynamicFramework(
    name: Feature.ThirdPartyLibs.rawValue,
    dependencies: [
//        .package(product: "SnapKit"),
        .package(product: "Moya"),
        .package(product: "RxMoya"),
//        .package(product: "Then"),
        //        .package(product: "Starscream"),
        .package(product: "RxSwift"),
        .package(product: "RxCocoa"),
//        .package(product: "RxKeyboard"),
//        .package(product: "Kingfisher"),
//        .package(product: "Lottie"),
        //        .package(product: "Fierbase"),
//        .package(product: "RxGesture"),
        .package(product: "RxDataSources")
    ]
)
