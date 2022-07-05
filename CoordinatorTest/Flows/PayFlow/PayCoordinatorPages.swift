//
//  PayCoordinatorPages.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 13.10.2021.
//

import UIKit

enum PayCoordinatorPages {
    case table
    case amount
    
    func pageTitleValue() -> String {
        switch self {
        case .table:
            return "Table"
        case .amount:
            return "Amount"
        }
    }
    
    func pageImage() -> UIImage {
        switch self {
        case .table:
            return UIImage(systemName: "tablecells") ?? UIImage()
        case .amount:
            return UIImage(systemName: "sum") ?? UIImage()
        }
    }
    
    func pageIndex() -> Int {
        switch self {
        case .table:
            return 0
        case .amount:
            return 1
        }
    }
    
    func isNavBarHidden() -> Bool {
        switch self {
        case .table:
            return true
        case .amount:
            return false
        }
    }
}
