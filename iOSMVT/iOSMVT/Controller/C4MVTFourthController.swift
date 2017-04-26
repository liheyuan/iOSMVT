//
//  C4MVTFourthController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/21.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTFourthController: C4MVTBaseController {

    // MARK: - Property
    override var navBarType: C4MVTNavBarType {
        return .home
    }

    override var navBarTitle: String {
        return "Crown"
    }

    override var needLoginCover: Bool {
        return false
    }

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // try loading
        tryLoading()
    }

    fileprivate func setupUI() {
        let label = UILabel()
        label.text = "Hello Crown"
        addSubviewToMain(label)

        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }
    
}
