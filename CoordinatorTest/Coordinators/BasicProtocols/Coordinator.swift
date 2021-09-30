//
//  Coordinatable.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 09.09.2021.
//

import UIKit

protocol Coordinator: FinishFlowProtocol {
    func start()
}

struct Empty {}

protocol FinishFlowProtocol: class {
    associatedtype Empty
    var finishFlow: ((Empty?) -> Void)? {get set}
}

protocol FinishScreenProtocol: class {
    associatedtype Empty
    var finish: ((Empty?) -> Void)? {get set}
}
