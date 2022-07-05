//
//  BaseCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 15.09.2021.
//

import UIKit

class BaseCoordinator: NSObject {
    
    let router: RouterMain
    
    var childCoordinators: [BaseCoordinator] = []
    
    init(navigationController: UINavigationController) {
        self.router = RouterMain(navigationController: navigationController)
    }
    
    func addDependency<T>(_ coordinator: T) -> T? {
        for element in self.childCoordinators {
            if element == coordinator as! BaseCoordinator { return nil }
        }
        self.childCoordinators.append(coordinator as! BaseCoordinator)
        return self.childCoordinators.last as? T
    }
    
    func removeDependency<T>(_ coordinator: T?) {
        if self.childCoordinators.isEmpty, coordinator == nil { return }
        
        for (index, element) in self.childCoordinators.enumerated() {
            if element === coordinator as! BaseCoordinator {
                (coordinator as! BaseCoordinator).childCoordinators.removeAll()
                (coordinator as! BaseCoordinator).router.removeAllControllers()
                self.childCoordinators.remove(at: index)
                break
            }
        }
    }
}
