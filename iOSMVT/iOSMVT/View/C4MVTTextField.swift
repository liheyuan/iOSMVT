//
//  C4MVTTextField.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/15.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

class C4MVTTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        autocapitalizationType = .none
        backgroundColor = UIColor.white
        tintColor = UIColor.UI_blue
        clearButtonMode = .whileEditing
        layer.borderColor = UIColor.UI_boundry.cgColor
        layer.borderWidth = 1
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return super.textRect(forBounds: bounds).insetBy(dx: 10, dy: 0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return textRect(forBounds: bounds)
    }

    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        return super.clearButtonRect(forBounds: bounds).offsetBy(dx: -5, dy: 0)
    }
}
