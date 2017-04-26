//
//  C4MVTSecondController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import Eureka
import ToastSwiftFramework

class C4MVTSecondFormController: C4MVTFormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        form +++ Section("UITableViewDemo")
            <<< ButtonRow("Refresh & Loadmore") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, row) in
                self.navigationController?.pushViewController(C4MVTMJDemoController(), animated: true)
            })
            <<< LabelRow("Custom cell height") {
                $0.title = $0.tag
            }
        
    }
}

class C4MVTSecondController: C4MVTBaseController {

    // MARK: - Property
    override var navBarType: C4MVTNavBarType {
        return .home
    }

    override var navBarTitle: String {
        return "Camera"
    }

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = C4MVTSecondFormController(nibName: nil, bundle: nil)
        embeddedViewControllerToMain(vc)

        // try loading
        tryLoading()
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }

}

