//
//  TransferBungetBlockTwoView.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 06.10.2021.
//

import UIKit

@IBDesignable final class TransferBungetBlockTwoView: CustomView {

    @IBOutlet private var contentView: UIView!
    @IBOutlet weak private var boxView: UIView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var subNameLabel: UILabel!
    @IBOutlet weak private var valueLabel: UILabel!
    
    @IBInspectable var name: String?
    @IBInspectable var subName: String?
    @IBInspectable var value: String?
    var moreBtnAction: (() -> Void)?
    
    override func viewDidLoad() {
        boxView.layer.cornerRadius = 5
        boxView.layer.borderWidth = 1
        boxView.layer.borderColor = TransfetBungetStyle.color.boxBorder.cgColor
        
        nameLabel.textColor = TransfetBungetStyle.color.dark
        subNameLabel.textColor = TransfetBungetStyle.color.blueGray
        valueLabel.textColor = TransfetBungetStyle.color.dark
        
        nameLabel.font = TransfetBungetStyle.font.nameBlockTwo
        subNameLabel.font = TransfetBungetStyle.font.subNameBlockTwo
        valueLabel.font = TransfetBungetStyle.font.valueBlockTwo
        
        nameLabel.text = (name != nil) ? name : "name"
        subNameLabel.text = (subName != nil) ? subName : "subName"
        valueLabel.text = (value != nil) ? value : "value"
    }
    
    @IBAction func moreBtn(_ sender: Any) {
        moreBtnAction?()
    }
}
