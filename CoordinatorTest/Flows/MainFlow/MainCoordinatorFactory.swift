//
//  MainCoordinatorFactory.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import Foundation

protocol MainCoordinatorFactoryProtocol {
    
    func makeMainVC() -> MainViewController
    func makeFirstVC() -> FirstViewController
    func makeSecondVC() -> SecondViewController
}

class MainCoordinatorFactory: MainCoordinatorFactoryProtocol {
    
    func makeMainVC() -> MainViewController {
        return MainViewController()
    }
    
    func makeFirstVC() -> FirstViewController {
        return FirstViewController()
    }
    
    func makeSecondVC() -> SecondViewController {
        return SecondViewController()
    }
}
