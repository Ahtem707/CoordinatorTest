//
//  AppCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

class AppCoordinator: BaseCoordinator, Coordinator {
    
    let factory = AppCoordinatorFactory()
    var finishFlow: ((InOutData.Empty?) -> Void)?
    
    var appNavController: UINavigationController {
      return router.toPresent()! as! UINavigationController
    }
    
    func start() {
//        startAuthFlow()
//        or
        startPayFlow()
//        startMainFlow(input: nil)
    }

    private func cancel() {
        router.popToRoot(animated: true)
    }
}

extension AppCoordinator {
    
    func startMainFlow(input: InOutData.MainCoordinatorIn?) {
        appNavController.setNavigationBarHidden(false, animated: false)
        
        weak var coordinator = addDependency(factory.makeMainCoordinator(navigationController: appNavController))
        coordinator?.finishFlow = { [weak self] _ in
            self?.removeDependency(coordinator)
            self?.startPayFlow()
            self?.exit()
        }
        coordinator?.input = input
        coordinator?.start()
    }
    
    func startAuthFlow() {
        appNavController.setNavigationBarHidden(true, animated: false)
        
        weak var coordinator = addDependency(factory.makeAuthCoordinator(navigationController: appNavController))
        coordinator?.finishFlow = { [weak self] out in
            self?.removeDependency(coordinator)
            self?.startMainFlow(input: nil)
        }
        coordinator?.start()
    }
    
    func startPayFlow() {
        appNavController.setNavigationBarHidden(true, animated: false)
        
        weak var coordinator = addDependency(factory.makePayCoordinator(navigationController: appNavController))
        coordinator?.finishFlow = { [weak self] output in
            self?.removeDependency(coordinator)
            let data = InOutData.MainCoordinatorIn(
                amount: output?.amount,
                phone: output?.phone)
            self?.startMainFlow(input: data)
        }
        coordinator?.start()
    }
}

extension AppCoordinator {
    func exit() {
        print("Complete AppCoordinator")
    }
}
