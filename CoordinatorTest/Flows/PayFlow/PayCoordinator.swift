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
    
    var tabBarController: UITabBarController
    
    override init(navigationController: UINavigationController) {
        tabBarController = UITabBarController()
        navigationController.viewControllers = [tabBarController]
        super.init(navigationController: navigationController)
    }
    
    func start() {
        startTabBarCoordinators(startPage: .table)
    }
}

extension PayCoordinator {
    
    func startTabBarCoordinators(startPage: PayCoordinatorPages) {
        
        let coordinators = [
            getNavController(page: .table),
            getNavController(page: .amount)
        ]
        tabBarController.setViewControllers(coordinators, animated: true)
        tabBarController.selectedIndex = startPage.pageIndex()
    }
    
    func getNavController(page: PayCoordinatorPages) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(page.isNavBarHidden(), animated: false)
        navController.tabBarItem = UITabBarItem(
            title: page.pageTitleValue(),
            image: page.pageImage(),
            tag: page.pageIndex())
        
        switch page {
        case .table:
            weak var tbCoord = addDependency(factory.makeTransferBungetCoordinator(navigationController: navController))
            tbCoord?.start()
        case .amount:
            weak var eaCoord = addDependency(factory.makeEnterAmountCoordinator(navigationController: navController))
            eaCoord?.start()
        }
        return navController
    }
}
