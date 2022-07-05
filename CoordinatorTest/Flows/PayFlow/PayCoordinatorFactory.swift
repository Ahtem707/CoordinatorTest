//
//  PayCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import UIKit

protocol PayCoordinatorFactoryProtocol {
    
    func makeTransferBungetCoordinator(navigationController: UINavigationController) -> TransferBungetCoordinator
    func makeEnterAmountCoordinator(navigationController: UINavigationController) -> EnterAmountCoordinator
}

class PayCoordinatorFactory: PayCoordinatorFactoryProtocol {
    
    func makeTransferBungetCoordinator(navigationController: UINavigationController) -> TransferBungetCoordinator {
        return TransferBungetCoordinator(navigationController: navigationController)
    }
    
    func makeEnterAmountCoordinator(navigationController: UINavigationController) -> EnterAmountCoordinator {
        return EnterAmountCoordinator(navigationController: navigationController)
    }
}
