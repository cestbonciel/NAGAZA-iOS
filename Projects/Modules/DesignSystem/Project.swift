//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import NAGAZAIOS

let project = Project.designSystem(
  name: Feature.DesignSystem.rawValue,
  dependencies: [
    .core,
    .package(product: "RxSwift"),
    .package(product: "RxCocoa"),
    .package(product: "SnapKit"),
    .package(product: "Then"),
    .package(product: "RxGesture"),
//    .package(product: "Kingfisher"),
    .package(product: "Lottie"),
  ],
  infoPlist: .extendingDefault(with: infoPlistExtension(name: Feature.DesignSystem.rawValue))
)
