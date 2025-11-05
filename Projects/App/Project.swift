//
//  Project.swift
//  NAGAZA-iOSManifests
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers
import NAGAZAIOS

let project = Project(
    name: Feature.App.rawValue,
    targets: [
        .makeApp(
            name: "App",
            sources: "Source/**",
            dependencies: [
                .feature
            ]
        )
    ]
)
