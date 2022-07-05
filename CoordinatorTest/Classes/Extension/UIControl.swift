//
//  UIControl.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 15.10.2021.
//

import UIKit

extension UIControl {
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping()->()) {
        addAction(UIAction { (action: UIAction) in closure() }, for: controlEvents)
    }
}
