//
//  C4MVTFirstController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/19.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTFirstController: C4MVTBaseController {

    // MARK: - Property
    override var navBarType: C4MVTNavBarType {
        return .home
    }

    override var navBarTitle: String {
        return "Home"
    }

    override var needLoginCover: Bool {
        return false
    }

    override var needLoadingCover: Bool {
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
        label.text = "Hello HomePage"
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
