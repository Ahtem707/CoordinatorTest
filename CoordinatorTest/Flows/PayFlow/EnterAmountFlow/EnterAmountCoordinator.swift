//
//  MainCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 20.09.2021.
//

import UIKit

extension InOutData {
    struct EnterAmountCoordinatorOut {
        var amount: Int?
        var phone: String?
    }
}

class EnterAmountCoordinator: BaseCoordinator, Coordinator {
    
    let factory = EnterAmountCoordinatorFactory()
    var res = InOutData.EnterAmountCoordinatorOut()
    var finishFlow: ((InOutData.EnterAmountCoordinatorOut?) -> Void)?
    
    func start() {
        startEnterSumScreen()
    }
}

// Start ViewControllers
extension EnterAmountCoordinator {
    func startEnterSumScreen() {
        let vc = factory.makeEnterAmountVC()
        vc.finish = { [weak self] out in
            self?.res.amount = out?.amount
            self?.startPhoneCheckScreen()
        }
        router.push(vc)
    }
    
    func startPhoneCheckScreen() {
        let vc = factory.makePhoneCheckVC()
        vc.finish = { [weak self] out in
            self?.res.phone = out?.telephone
            self?.finishFlow?(self?.res)
        }
        router.push(vc)
    }
}
