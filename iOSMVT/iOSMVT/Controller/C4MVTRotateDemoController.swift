//
//  C4MVTRotateDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/27.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTRotateDemoController: C4MVTBaseController {

    // MARK: - Property
    override var navBarTitle: String {
        return "Rotate Demo"
    }

    override var needRotate: Bool {
        return true
    }

    override var needLoadingCover: Bool {
        return false
    }

    // MARK: - UI Getter
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Try rotate the device & try jump back"
        return label
    }()

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    fileprivate func setupUI() {
        addSubviewToMain(label)

        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}

