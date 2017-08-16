//
//  C4MVTNoNeedAuthApiDemoController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/8/16.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class C4MVTNoNeedAuthApiDemoController: C4MVTBaseController {

    // MARK: - Property
    override var navBarTitle: String {
        return "NeedAuth Api Demo "
    }

    // MARK: - UI Getter
    fileprivate lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Hello NoNeedAuth Api demo"
        return label
    }()

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tryLoading()
    }

    fileprivate func setupUI() {
        addSubviewToMain(label)

        label.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
    }

    override func loading() {
        // Here insert 1s to emulate slow network
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            let api = C4MVTNoNeedAuthApi()
            api.startWithCallback(succ: {
                // Render
                if let obj: C4MVTNeedAuthObject = api.mapToObject() {
                    self.label.text = obj.msg
                }
                self.loadingSuccess()
            }, fail: { errType in
                self.loadingFailed()
            })
        }
        
    }
}
