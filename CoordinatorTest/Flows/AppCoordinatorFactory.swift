//
//  CoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

protocol AppCoordinatorFactoryProtocol {
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator
    func makePayCoordinator(navigationController: UINavigationController) -> PayCoordinator
}

class AppCoordinatorFactory: AppCoordinatorFactoryProtocol {
    func makeMainCoordinator(navigationController: UINavigationController) -> MainCoordinator {
        return MainCoordinator(navigationController: navigationController)
    }
    
    func makeAuthCoordinator(navigationController: UINavigationController) -> AuthCoordinator {
        return AuthCoordinator(navigationController: navigationController)
    }
    
    func makePayCoordinator(navigationController: UINavigationController) -> PayCoordinator {
        return PayCoordinator(navigationController: navigationController)
    }
}
