//
//  MainCoordinator.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 20.09.2021.
//

import UIKit

extension AuthCoordinator {
    struct Out {
        var code: String?
    }
}

class AuthCoordinator: BaseCoordinator, Coordinator {
    
    let factory = AuthCoordinatorFactory()
    var finishFlow: ((Out?) -> Void)?
    
    func start() {
        startEnterPinScreen()
    }
    
    var code: String?
}

// Start ViewControllers
extension AuthCoordinator {
    func startEnterPinScreen() {
        let vc = factory.makeEnterPinVC()
        vc.model.finish = { [weak self] output in
            self?.code = output?.code
            switch output?.state {
            case .success:
                self?.startAlertScreen(.success)
            case .error:
                self?.startAlertScreen(.error)
            case .forgot:
                print("forgot")
            case .none:
                print("Error")
            }
        }
        router.push(vc)
    }
    
    func startAlertScreen(_ type: AlertViewController.AlertType) {
        let vc = factory.makeAlertFirstVC()
        vc.type = type
        vc.finish = { [weak self] _ in
            print("finish AuhtCoordinator")
            self?.finishFlow?(Out(code: self?.code))
        }
        router.present(vc, animated: true)
    }
}
