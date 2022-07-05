//
//  SecondViewController.swift
//  Test
//
//  Created by Ahtem Sitjalilov on 17.09.2021.
//

import UIKit

class SecondViewController: UIViewController, FinishScreenProtocol {

    var finish: ((InOutData.Empty?)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func completeBtn(_ sender: Any) {
        finish?(nil)
    }
}
