//
//  MainCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 20.09.2021.
//

import UIKit

class TransferBungetCoordinator: BaseCoordinator, Coordinator {
    
    let factory = TransferBungetCoordinatorFactory()
    var finishFlow: ((InOutData.Empty?) -> Void)?
    
    func start() {
        startTransferBungetScreen()
    }
}

// Start ViewControllers
extension TransferBungetCoordinator {
    func startTransferBungetScreen() {
        let vc = factory.makeTransferBungetVC()
        vc.finish = { [weak self] _ in
            self?.finishFlow?(nil)
        }
        router.push(vc)
    }
}
