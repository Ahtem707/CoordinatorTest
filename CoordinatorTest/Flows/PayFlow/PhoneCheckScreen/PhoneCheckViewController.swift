//
//  PhoneCheckViewController.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 27.09.2021.
//

import UIKit
import ReactiveKit
import Bond

extension InOutData {
    struct PhoneCheckOut {
        var telephone: String?
    }
}

class PhoneCheckViewController: UIViewController, FinishScreenProtocol {

    @IBOutlet weak var phoneTextField: TextFieldDefault!
    @IBOutlet weak var sendCodeBtn: UIView!
    @IBOutlet weak var codeTextField: TextFieldDefault!
    @IBOutlet weak var nextBtn: UIButton!
    
    var finish: ((InOutData.PhoneCheckOut?) -> Void)?
    
    let viewModel = PhoneCheckViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        validation()
    }
    
    func validation() {
        
        let btnValid = codeTextField.reactive.text.map { [weak self] in
            $0 == self?.viewModel.correctCode
        }.toSignal()
        
        btnValid.bind(to: nextBtn.reactive.isEnabled)
        btnValid.map {$0 ? .red : .gray}.bind(to: nextBtn.reactive.backgroundColor)
    }
    
    @IBAction func sendCodeBtn(_ sender: Any) {
        
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        guard let phone = phoneTextField.text else {return}
        let result = InOutData.PhoneCheckOut(telephone: phone)
        dismiss(animated: true)
        finish?(result)
    }
}
