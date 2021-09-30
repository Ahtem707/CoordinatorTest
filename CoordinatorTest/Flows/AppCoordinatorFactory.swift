//
//  CoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator?
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator?
    func makePayCoordinator(navigationController: UINavigationController) -> PayCoordinator?
}

class AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator? {
        let coordinator = MainCoordinator(navigationController: navigationController)
        return coordinator
    }
    
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator? {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        return coordinator
    }
    
    func makePayCoordinator(navigationController: UINavigationController) -> PayCoordinator? {
        let coordinator = PayCoordinator(navigationController: navigationController)
        return coordinator
    }
}
