//
//  BaseCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 15.09.2021.
//

import UIKit

class InOutData {}

class BaseCoordinator: NSObject {
    
    let router: RouterMain
    
    init(navigationController: UINavigationController) {
        self.router = RouterMain(navigationController: navigationController)
    }
    
    init(rootViewController: UINavigationController) {
        self.router = RouterMain(rootViewController: rootViewController)
    }
}
