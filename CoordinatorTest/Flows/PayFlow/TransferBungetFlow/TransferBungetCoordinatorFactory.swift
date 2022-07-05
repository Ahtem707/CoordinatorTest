//
//  PayCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import Foundation

protocol TransferBungetCoordinatorFactoryProtocol {
    
    func makeTransferBungetVC() -> TransferBungetViewController
}

class TransferBungetCoordinatorFactory: TransferBungetCoordinatorFactoryProtocol {
    func makeTransferBungetVC() -> TransferBungetViewController {
        return TransferBungetViewController()
    }
}
