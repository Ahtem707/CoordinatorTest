//
//  AppCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

class AppCoordinator: BaseCoordinator, Coordinator {
    
    let factory = AppCoordinatorFactory()
    var finishFlow: ((Empty?) -> Void)?
    
    func start() {
//        startAuthFlow()
//        or
        startPayFlow()
    }

    private func cancel() {
        router.popToRoot(animated: true)
    }
}

extension AppCoordinator {
    
    func startMainFlow(input: InOutData.MainCoordinatorIn?) {
        let nav = router.toPresent() as! UINavigationController
        nav.setNavigationBarHidden(false, animated: false)
        
        var coordinator = factory.makeMainCoordinator(navigationController: nav)
        coordinator?.finishFlow = { [weak self] _ in
            coordinator?.router.removeAllControllers()
            coordinator = nil
            self?.exit()
        }
        coordinator?.input = input
        coordinator?.start()
    }
    
    func startAuthFlow() {
        let nav = router.toPresent() as! UINavigationController
        nav.setNavigationBarHidden(true, animated: false)
        
        var coordinator = factory.makeAuthCoordinator(navigationController: nav)
        coordinator?.finishFlow = { [weak self] out in
            coordinator?.router.removeAllControllers()
            coordinator = nil
            self?.startMainFlow(input: nil)
        }
        coordinator?.start()
    }
    
    func startPayFlow() {
        let nav = router.toPresent() as! UINavigationController
        nav.setNavigationBarHidden(true, animated: false)
        
        var coordinator = factory.makePayCoordinator(navigationController: nav)
        coordinator?.finishFlow = { [weak self] output in
            coordinator?.router.removeAllControllers()
            coordinator = nil
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
