//
//  TabBtns.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 14.10.2021.
//

import UIKit
class NewSpace {
fileprivate struct Style {
    static let font = UIFont.systemFont(ofSize: 12)
    static let bacgroundSelected = UIColor.blueBlue
    static let backgroundDisabled = UIColor.paleLilac
    static let textColorSelected = UIColor.white
    static let textcolorDisable = UIColor.dark
}

class TaxAdditionalBtnsViewModel {
    
    let startBtnSelected: Int = 2
    var btnSelected: UIButton?
    let buttons: [String] = [
        "НДС 20%",
        "НДС 10%",
        "Без НДС",
        "Другое",
        "Other",
        "TwoOther"
    ]
}

@IBDesignable final class TaxAdditionalBtns: CustomViewCode {
    
    var hStack: UIStackView?
    
    let viewModel = TaxAdditionalBtnsViewModel()
    
    override func viewDidLoad() {
        setupView()
        setupBtns()
    }
    
    func setupView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
        hStack = UIStackView()
        guard let hStack = hStack else {return}
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.distribution = .fillProportionally
        hStack.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            hStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10),
            hStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            hStack.widthAnchor.constraint(greaterThanOrEqualTo: scrollView.widthAnchor)
        ])
        
        
    }
    
    func setupBtns() {
        viewModel.buttons.enumerated().forEach { [weak self] (i,btnContent) in
            guard let hStack = self?.hStack else {return}
            let btn = addBtn(parent: hStack)
            btn.setTitle(btnContent, for: .normal)
            btn.addAction { [weak self] in
                self?.viewModel.btnSelected?.backgroundColor = Style.backgroundDisabled
                self?.viewModel.btnSelected?.setTitleColor(Style.textcolorDisable, for: .normal)
                self?.viewModel.btnSelected = btn
                btn.backgroundColor = Style.bacgroundSelected
                btn.setTitleColor(Style.textColorSelected, for: .normal)
            }
            if i == viewModel.startBtnSelected {
                viewModel.btnSelected = btn
            }
        }
        viewModel.btnSelected?.backgroundColor = Style.bacgroundSelected
        viewModel.btnSelected?.setTitleColor(Style.textColorSelected, for: .normal)
    }
    
    func addBtn(parent: UIStackView) -> UIButton {
        let btn = UIButton()
        btn.titleLabel?.font = Style.font
        btn.setTitleColor(Style.textcolorDisable, for: .normal)
        btn.backgroundColor = Style.backgroundDisabled
        btn.contentEdgeInsets.left = 16
        btn.contentEdgeInsets.right = 16
        btn.layer.cornerRadius = 35 / 2
        btn.translatesAutoresizingMaskIntoConstraints = false
        parent.addArrangedSubview(btn)
        NSLayoutConstraint.activate([
            btn.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        return btn
    }
}
}
