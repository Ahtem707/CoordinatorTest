//
//  String.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 01.10.2021.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
}
