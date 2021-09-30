//
//  PayCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import Foundation

protocol PayCoordinatorFactoryProtocol {
    
    func makeEnterAmountVC() -> EnterAmountViewController
    func makePhoneCheckVC() -> PhoneCheckViewController
}

class PayCoordinatorFactory: PayCoordinatorFactoryProtocol {
    func makeEnterAmountVC() -> EnterAmountViewController {
        return EnterAmountViewController()
    }
    
    func makePhoneCheckVC() -> PhoneCheckViewController {
        return PhoneCheckViewController()
    }
}
