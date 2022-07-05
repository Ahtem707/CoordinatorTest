//
//  MainCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 20.09.2021.
//

import UIKit

extension InOutData {
    struct MainCoordinatorIn {
        var amount: Int?
        var phone: String?
    }
}

class MainCoordinator: BaseCoordinator, Coordinator {
    
    let factory = MainCoordinatorFactory()
    var finishFlow: ((InOutData.Empty?) -> Void)?
    
    var input: InOutData.MainCoordinatorIn?
    
    func start() {
        startMainScreen()
    }
}

// Start ViewControllers
extension MainCoordinator {
    func startMainScreen() {
        let vc = factory.makeMainVC()
        vc.finish = { [weak self] _ in
            self?.startFirstScreen()
        }
        let data = InOutData.MainViewControllerIn(amount: input?.amount, phone: input?.phone)
        vc.input = data
        router.push(vc)
    }
    
    func startFirstScreen() {
        let vc = factory.makeFirstVC()
        vc.finish = { [weak self] _ in
            self?.startSecondScreen()
        }
        router.push(vc)
    }

    func startSecondScreen() {
        let vc = factory.makeSecondVC()
        vc.finish = { [weak self] _ in
            self?.finishFlow?(nil)
        }
        router.push(vc)
    }
}
