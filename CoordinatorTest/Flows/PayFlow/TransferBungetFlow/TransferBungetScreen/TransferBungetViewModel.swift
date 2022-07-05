//
//  TransferBungetNBlockViewModel.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 13.10.2021.
//

import UIKit

class TransferBungetViewModel {
    
    enum BlockData: CaseIterable {
        
        case nameContragent
        case sumPay
        case date
        case lookAllRequisites
        case requisites
    }
    
    let data = BlockData.allCases
}

extension TransferBungetViewModel.BlockData {
    func getBlockType() -> UIView {
        switch self {
        case .nameContragent,
             .sumPay,
             .date:
            return TransferBungetBlockView()
        case .lookAllRequisites:
            return UIView()
        case .requisites:
            return UIView()
        }
    }
    
    func setName(_ block: TransferBungetViewModel.BlockData) {
        block
    }
    
    func getName() -> String {
        switch self {
        case .nameContragent:
            return "Наименование контрагента"
        default:
            fatalError("Еще не реализовано")
        }
    }
}
