//
//  AppDelegate+Register.swift
//  Nagaza
//
//  Created by SeungMin on 4/30/24.
//

import HomeInterface
import MapInterface
import ReviewInterface
import MyPageInterface

import Data
import Core

extension AppDelegate {
    var container: DIContainer {
        DIContainer.shared
    }
    
    func registerDependencies() {
        container.register(
            interface: HomeUseCaseProtocol.self,
            implement: {
                HomeUseCase(
                    roomsRepository: HomeRepository(
                        isStub: true,
                        sampleStatusCode: 200,
                        customEndpointClosure: nil
                    )
                )
            }
        )
        
        container.register(
            interface: RegionSettingUseCaseProtocol.self,
            implement: {
                RegionSettingUseCase(
                    regionSettingRepository: RegionSettingRepository(regionSettingStorage: UserDefaultsRegionSettingStorage())
                )
            }
        )
        
        container.register(
            interface: MapUseCaseProtocol.self,
            implement: {
                MapUseCase(
                    repository: MapRepository(
                        isStub: true,
                        sampleStatusCode: 200,
                        customEndpointClosure: nil
                    )
                )
            }
        )
    }
}
