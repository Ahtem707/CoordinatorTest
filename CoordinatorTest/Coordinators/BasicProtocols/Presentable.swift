//
//  Presentable.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 15.09.2021.
//

import UIKit

protocol Presentable {
    func toPresent() -> UIViewController?
}
 
extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
      return self
    }
}
