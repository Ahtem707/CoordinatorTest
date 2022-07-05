//
//  TransferBungetBlockScreen.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 04.10.2021.
//

import UIKit

fileprivate class Style: TransfetBungetStyle {}

class BudgetValue {
    
    var blockShow: Bool = true
    var name: String?
    var value: String?
    var info: String?
    var infoBtnShow: Bool = false
    var infoBtnAction: (()->Void)?
    
}

struct TransferBungetBlockViewModel {
    
    let value: BudgetValue
    
}

@IBDesignable final class TransferBungetBlockView: CustomView {
    
    @IBOutlet weak private var contentView: UIView!
    @IBOutlet weak private var boxView: UIView!
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var valueTextView: UITextView!
    @IBOutlet weak private var infoLabel: UILabel!
    @IBOutlet weak private var infoBtn: UIButton!
    
    @IBInspectable var name: String?
    @IBInspectable var value: String?
    @IBInspectable var info: String?
    @IBInspectable var infoBtnShow: Bool = false
    var infoBtnAction: (() -> Void)?
    
    override func viewDidLoad() {
        boxView.layer.cornerRadius = 5
        boxView.layer.borderWidth = 1
        boxView.layer.borderColor = TransfetBungetStyle.color.boxBorder.cgColor
        boxView.layer.borderColor = TransfetBungetStyle.color.boxBorder.cgColor

        nameLabel.textColor = TransfetBungetStyle.color.blueGray
        valueTextView.textColor = TransfetBungetStyle.color.dark
        infoLabel.textColor = TransfetBungetStyle.color.blueGray

        nameLabel.font = TransfetBungetStyle.font.nameBlock
        valueTextView.font = TransfetBungetStyle.font.valueBlock
        infoLabel.font = TransfetBungetStyle.font.infoBlock
        
        valueTextView.textContainer.lineFragmentPadding = 0.0
        

        valueTextView.text = (value != nil) ? value : "value"
        if name != nil {
            nameLabel.text = name
        } else {
            nameLabel.removeFromSuperview()
        }
        if info != nil {
            infoLabel.text = info
        } else {
            infoLabel.removeFromSuperview()
        }

        infoBtn.isHidden = !infoBtnShow
        infoBtn.isEnabled = infoBtnShow
    }
    
    @IBAction func infoBtn(_ sender: Any) {
        infoBtnAction?()
    }
}
