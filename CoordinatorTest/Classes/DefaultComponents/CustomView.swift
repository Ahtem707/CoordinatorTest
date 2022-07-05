//
//  UIView.swift
//  CoordinatorTest
//
//  Created by Ahtem Sitjalilov on 01.10.2021.
//

import UIKit

class CustomView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewDidLoad()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setupView()
        viewDidLoad()
    }
    
    private func setupView() {
        let view = loadViewFromNib()
        view.frame = bounds
        view.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(view)
    }
    
    private func loadViewFromNib() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let className = String.className(type(of: self))
        
        let view = bundle.loadNibNamed(className, owner: self, options: nil)?.first as! UIView
        return view
    }
    
    func viewDidLoad() {}
}

class CustomViewCode: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewDidLoad()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        viewDidLoad()
    }
    
    func viewDidLoad() {}
}
