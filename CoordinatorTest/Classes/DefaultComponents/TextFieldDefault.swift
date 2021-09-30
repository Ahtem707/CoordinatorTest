//
//  TextFieldDefault.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 29.09.2021.
//

import UIKit

class TextFieldDefault: UITextField, UITextFieldDelegate {
    
    @IBInspectable var onlyNumbers: Bool = false
    @IBInspectable var maxLeng: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let charIsNumber = string.first?.isNumber else {return true}
        guard let leng = textField.text?.count else {return true}
        if onlyNumbers && !charIsNumber {
            return false
        }
        if maxLeng != 0 && leng >= maxLeng {
            return false
        }
        return true
    }
}
