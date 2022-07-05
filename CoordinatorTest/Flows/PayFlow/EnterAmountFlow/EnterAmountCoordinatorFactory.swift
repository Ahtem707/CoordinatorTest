//
//  PayCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import Foundation

protocol EnterAmountCoordinatorFactoryProtocol {
    
    func makeEnterAmountVC() -> EnterAmountViewController
    func makePhoneCheckVC() -> PhoneCheckViewController
}

class EnterAmountCoordinatorFactory: EnterAmountCoordinatorFactoryProtocol {
    func makeEnterAmountVC() -> EnterAmountViewController {
        return EnterAmountViewController()
    }
    
    func makePhoneCheckVC() -> PhoneCheckViewController {
        return PhoneCheckViewController()
    }
}
