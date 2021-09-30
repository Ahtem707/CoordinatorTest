//
//  EnterPinManager.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 22.09.2021.
//

import Foundation

class EnterPinManager {
    public static var shared: EnterPinManager?
    
    public static func createShared() -> EnterPinManager? {
        EnterPinManager.shared = EnterPinManager()
        return EnterPinManager.shared
    }
    
    public static func destroyShared() {
        EnterPinManager.shared = nil
    }
    
    var code: [Int]?
}
