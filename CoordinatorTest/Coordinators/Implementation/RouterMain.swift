//
//  RouterMain.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

class RouterMain: Routable {
    
    // MARK:- Private variables
    weak var navigationViewController: UINavigationController?
    weak var rootViewController: UIViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationViewController = navigationController
        self.rootViewController = navigationController.viewControllers.first
    }
    
    func toPresent() -> UIViewController? {
        return navigationViewController
    }
    
    func present(_ module: Presentable?) {
        present(module, animated: true)
    }
    
    func present(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        navigationViewController?.present(controller, animated: animated, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true)
    }
    
    func dismiss(animated: Bool) {
        navigationViewController?.dismiss(animated: animated, completion: nil)
    }
    
    func push(_ module: Presentable?) {
        push(module, animated: true)
    }
    
    func push(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        
        navigationViewController?.pushViewController(controller, animated: animated)
    }
    
    func pop() {
        pop(animated: true)
    }
    
    func pop(animated: Bool) {
        navigationViewController?.popViewController(animated: animated)
    }
    
    func popToRoot(animated: Bool) {
        guard let rootViewController = rootViewController,
              let contains = navigationViewController?.viewControllers.contains(rootViewController),
              contains else {
            popAll(animated: animated)
            return
        }
        navigationViewController?.popToViewController(rootViewController, animated: animated)
    }
    
    func popAll(animated: Bool) {
        navigationViewController?.popToRootViewController(animated: animated)
    }
    
    func popBack(_ nb: Int) {
        if let viewControllers: [UIViewController] = self.navigationViewController?.viewControllers {
            guard viewControllers.count < nb else {
                self.navigationViewController?.popToViewController(viewControllers[viewControllers.count - nb], animated: true)
                return
            }
        }
    }
    
    func popBack<T: UIViewController>(toControllerType: T.Type) {
        if var viewControllers: [UIViewController] = self.navigationViewController?.viewControllers {
            viewControllers = viewControllers.reversed()
            for currentViewController in viewControllers {
                if currentViewController .isKind(of: toControllerType) {
                    self.navigationViewController?.popToViewController(currentViewController, animated: true)
                    break
                }
            }
        }
    }
    
    func removeAllControllers() {
        self.navigationViewController?.viewControllers.removeAll()
    }
}
