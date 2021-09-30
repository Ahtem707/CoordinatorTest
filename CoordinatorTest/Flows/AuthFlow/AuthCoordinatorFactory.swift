//
//  AuthCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import Foundation

protocol AuthCoordinatorFactoryProtocol {
    
    func makeEnterPinVC() -> EnterPinViewController
    func makeAlertFirstVC() -> AlertViewController
}

class AuthCoordinatorFactory: AuthCoordinatorFactoryProtocol {
    func makeEnterPinVC() -> EnterPinViewController {
        return EnterPinViewController()
    }
    
    func makeAlertFirstVC() -> AlertViewController {
        return AlertViewController()
    }
}
