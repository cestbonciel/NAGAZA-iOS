//
//  MapFlowCoordinator.swift
//  Nagaza
//
//  Created by 전성훈 on 2023/11/07.
//

import UIKit

protocol MapFlowCoordinaterDependencies {
    func makeMapViewController(actions: MapViewModelActions) -> MapViewController
    func makeMapSearchViewController(actions: MapSearchViewModelActions) -> MapSearchViewController
}

final class MapFlowCoordinator: BaseCoordinator {
    private let dependencies: MapFlowCoordinaterDependencies!
    
    private weak var mapVC: MapViewController?
    
    init(
        navigationController: UINavigationController,
        dependencies: MapFlowCoordinaterDependencies
    ) {
        self.dependencies = dependencies
        super.init(navigationController: navigationController)
    }
    
    override func start() {
        let actions = MapViewModelActions(toMapSearch: toMapSearch)
        let vc = dependencies.makeMapViewController(actions: actions)
        
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController = UINavigationController(rootViewController: vc)
        
        mapVC = vc
    }
    
    func toMapSearch() {
        let actions = MapSearchViewModelActions()
        let vc = dependencies.makeMapSearchViewController(actions: actions)
        
        navigationController.pushViewController(vc, animated: true)
    }
}
