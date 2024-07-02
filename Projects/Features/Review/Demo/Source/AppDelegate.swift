//
//  AppDelegate.swift
//  ReviewInterface
//
//  Created by SeungMin on 5/22/24.
//


import UIKit

import Core
import Data

import Review
import ReviewInterface

//import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        registerDependencies()
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}

extension AppDelegate {
    var container: DIContainer {
        DIContainer.shared
    }
    
    func registerDependencies() {
//        container.register(
//            interface: HomeUseCase.self,
//            implement: {
//                DefaultHomeUseCase(
//                    roomsRepository: DefaultHomeRepository(
//                        isStub: true,
//                        sampleStatusCode: 200,
//                        customEndpointClosure: nil
//                    )
//                )
//            }
//        )
    }
}


