//
//  C4MVTLoadingDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/27.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTLoadingDemoController: C4MVTBaseController {

    // MARK: - Property
    override var navBarTitle: String {
        return "Loading Demo "
    }

    // MARK: - UI Getter
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello loading demo"
        return label
    }()

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            // try loading
            self.loadingSuccess()
        }
    }

    fileprivate func setupUI() {
        addSubviewToMain(label)

        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }
}
