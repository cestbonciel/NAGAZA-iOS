//
//  InfoPlist.swift
//  NAGAZAIOS
//
//  Created by SeungMin on 5/15/24.
//

import ProjectDescription

public let infoPlistExtension: [String: Plist.Value] = [
    "CFBundleName": "NAGAZA",
    "CFBundleShortVersionString": "1.0.0",
    "CFBundleVersion": "1",
    "UILaunchStoryboardName": "LaunchScreen",
    "UIApplicationSceneManifest": [
        "UIApplicationSupportsMultipleScenes": false,
        "UISceneConfigurations": [
            "UIWindowSceneSessionRoleApplication": [
                [
                    "UISceneConfigurationName": "Default Configuration",
                    "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                ],
            ]
        ]
    ],
    "App Transport Security Settings": ["Allow Arbitrary Loads": true],
    "Privacy - Photo Library Additions Usage Description": "프로필 사진 촬영을 위한 권한 설정",
    "NSLocationWhenInUseUsageDescription": "앱 사용 중 위치 정보 수집을 위한 권한 설정",
    "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
    "UIAppFonts": [
      "Item 0": "SpoqaHanSansNeo-Bold.ttf",
      "Item 1": "SpoqaHanSansNeo-Light.ttf",
      "Item 2": "SpoqaHanSansNeo-Medium.ttf",
      "Item 3": "SpoqaHanSansNeo-Regular.ttf",
      "Item 4": "SpoqaHanSansNeo-Thin.ttf"
    ],
    "UIUserInterfaceStyle": "Light"
]

public func infoPlistExtension(name: String) -> [String: Plist.Value] {
    [
        "CFBundleName": "\(name)",
        "CFBundleShortVersionString": "1.0.0",
        "CFBundleVersion": "1",
        "UILaunchStoryboardName": "LaunchScreen",
        "UIApplicationSceneManifest": [
            "UIApplicationSupportsMultipleScenes": false,
            "UISceneConfigurations": [
                "UIWindowSceneSessionRoleApplication": [
                    [
                        "UISceneConfigurationName": "Default Configuration",
                        "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                    ],
                ]
            ]
        ],
        "App Transport Security Settings": ["Allow Arbitrary Loads": true],
        "Privacy - Photo Library Additions Usage Description": "프로필 사진 촬영을 위한 권한 설정",
        "NSLocationWhenInUseUsageDescription": "앱 사용 중 위치 정보 수집을 위한 권한 설정",
        "NSAppTransportSecurity": ["NSAllowsArbitraryLoads": true],
        "UIAppFonts": [
            "Item 0": "SpoqaHanSansNeo-Bold.ttf",
            "Item 1": "SpoqaHanSansNeo-Light.ttf",
            "Item 2": "SpoqaHanSansNeo-Medium.ttf",
            "Item 3": "SpoqaHanSansNeo-Regular.ttf",
            "Item 4": "SpoqaHanSansNeo-Thin.ttf"
        ],
        "UIUserInterfaceStyle": "Light"
    ]
}
