//
//  C4MVTThirdController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/19.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

class C4MVTThirdController: C4MVTBaseController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navBarType = .home
        navBarTitle = "Setting"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // try loading
        tryLoading()
    }

    fileprivate func setupUI() {
        let btn = UIButton()
        btn.setTitle("Logout", for: UIControlState())
        btn.addTarget(self, action: #selector(logoutBtnPressed), for: .touchUpInside)
        btn.setTitleColor(UIColor.black, for: UIControlState())
        addSubviewToMain(btn)

        btn.snp.makeConstraints { (make) in
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

    func logoutBtnPressed() {
        C4MVTAccountAgent.shared.logout()
    }
    
}
