//
//  EnterSumViewController.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 23.09.2021.
//

import UIKit
import ReactiveKit
import Bond

extension InOutData {
    struct EnterAmountOut {
        var amount: Int?
    }
}

class EnterAmountViewController: UIViewController, FinishScreenProtocol {

    var finish: ((InOutData.EnterAmountOut?)->Void)?
    
    @IBOutlet weak var textField: TextFieldDefault!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextBtnValidating()
    }
    
    func nextBtnValidating() {
        let valid = textField.reactive.text.map {$0 != ""}.toSignal()
        
        valid.bind(to: nextBtn.reactive.isEnabled)
        valid.map {$0 ? .red : .gray}
            .bind(to: nextBtn.reactive.backgroundColor)
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        guard let text = textField.text else {return}
        guard let amount = Int(text) else {return}
        let res = InOutData.EnterAmountOut(amount: amount)
        finish?(res)
    }
}
