//
//  TransferBungetBlockStyle.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 04.10.2021.
//

import UIKit

class TransfetBungetStyle {
    struct color {
        static let boxBorder = UIColor(red: 0.68, green: 0.70, blue: 0.78, alpha: 1.00)
        static let blueGray = UIColor(red: 0.51, green: 0.54, blue: 0.64, alpha: 1.00)
        static let dark = UIColor(red: 0.15, green: 0.17, blue: 0.25, alpha: 1.00)
        static let paleLilac = UIColor(red: 0.89, green: 0.90, blue: 0.93, alpha: 1.00)
        static let blue = UIColor(red: 0.14, green: 0.33, blue: 0.84, alpha: 1.00)
        static let white = UIColor.white
    }
    struct font {
        static let nameBlock = UIFont.getFont()
        static let valueBlock = UIFont.getFont()
        static let infoBlock = UIFont.getFont(size: 12)
        static let nameBlockTwo = UIFont.getFont(size: 16, weight: .regular)
        static let subNameBlockTwo = UIFont.getFont()
        static let valueBlockTwo = UIFont.getFont(size: 16, weight: .bold)
    }
}

extension UIFont {
    fileprivate static func getFont(size: CGFloat = 14, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
