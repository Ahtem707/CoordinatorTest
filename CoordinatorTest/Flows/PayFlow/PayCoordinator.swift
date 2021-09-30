//
//  MainCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 20.09.2021.
//

import UIKit

extension InOutData {
    struct PayCoordinatorOut {
        var amount: Int?
        var phone: String?
    }
}

class PayCoordinator: BaseCoordinator, Coordinator {
    
    let factory = PayCoordinatorFactory()
    var finishFlow: ((InOutData.PayCoordinatorOut?) -> Void)?
    var res = InOutData.PayCoordinatorOut()
    
    func start() {
        startEnterSumScreen()
    }
}

// Start ViewControllers
extension PayCoordinator {
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
        router.present(vc)
    }
}
