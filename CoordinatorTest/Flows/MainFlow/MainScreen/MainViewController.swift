//
//  MainViewController.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

extension InOutData {
    struct MainViewControllerIn {
        var amount: Int?
        var phone: String?
    }
}

class MainViewController: UIViewController, FinishScreenProtocol {
    
    var input: InOutData.MainViewControllerIn?
    var finish: ((InOutData.Empty?) -> Void)?
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        title = "Main"
        
        amountLabel.text = "\(input?.amount ?? 0)"
        phoneLabel.text = input?.phone
    }
    @IBAction func completeBtn(_ sender: Any) {
        finish?(nil)
    }
}
