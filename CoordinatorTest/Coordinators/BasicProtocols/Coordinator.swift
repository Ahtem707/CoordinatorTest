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

class InOutData {
    struct Empty {}
}

protocol FinishFlowProtocol: class {
    associatedtype Empty = InOutData.Empty
    var finishFlow: ((Empty?) -> Void)? {get set}
}

protocol FinishScreenProtocol: class {
    associatedtype Empty = InOutData.Empty
    var finish: ((Empty?) -> Void)? {get set}
}
