//
//  TransferBungetViewController.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 30.09.2021.
//

import UIKit

enum ViewId: String {
    
    case first = "first"
    case secon = "second"
}

class TransferBungetViewController: UIViewController, FinishScreenProtocol {
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var showHideBtn: UIButton!
    @IBOutlet weak var requisitesView: UIView!
    @IBOutlet weak var payBtn: UIButton!
    @IBOutlet weak var nalogSegmentControl: UISegmentedControl!
    
    var finish: ((InOutData.Empty?) -> Void)?
    let viewModel = TransferBungetViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupStackView()
    }
    
    func setupStackView() {
        viewModel.data.forEach { [weak self] item in
            let block = item.getBlockType() as! TransferBungetBlockView
            block.name = item.getName()
            stackView.addSubview(block)
        }
    }
    
    func setup() {
        title = "Перевод в бюджет"
        
        requisitesView.isHidden = true
        payBtn.backgroundColor = TransfetBungetStyle.color.blue
        payBtn.setTitleColor(TransfetBungetStyle.color.white, for: .normal)
    }
    
    var requisitesStatus: Bool = false {
        didSet {
            var image: UIImage?
            if requisitesStatus {
                image = UIImage(named: "iconArrowUp")
                requisitesView.isHidden = false
            } else {
                image = UIImage(named: "iconArrowDown")
                requisitesView.isHidden = true
            }
            showHideBtn.setImage(image, for: .normal)
        }
    }
    
    @IBAction func showHideBtn(_ sender: Any) {
        requisitesStatus = !requisitesStatus
    }
    
    @IBAction func payBtn (_ sender: Any) {
        finish?(nil)
    }
    
    @IBAction func nalogSegmentControl(_ sender: UISegmentedControl) {
//        viewModel.hadleSengement(sender.selectedSegmentIndex)
    }
}
