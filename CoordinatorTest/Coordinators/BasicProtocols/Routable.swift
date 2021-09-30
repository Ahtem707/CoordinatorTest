//
//  Routable.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 15.09.2021.
//

import UIKit

protocol Routable: Presentable {
    
    typealias CompletionBlock = ()->()
    
    func present(_ module: Presentable?)
    func present(_ module: Presentable?, animated: Bool)
 
    func dismiss()
    func dismiss(animated: Bool)
    
    func push(_ module: Presentable?)
    func push(_ module: Presentable?, animated: Bool)
    
    func pop()
    func pop(animated: Bool)
    func popToRoot(animated: Bool)
    func popAll(animated: Bool)
    func popBack(_ nb: Int)
    func popBack<T: UIViewController>(toControllerType: T.Type)
    func removeAllControllers()
}
