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

        form
            +++ Section("UITableView Demo")
            <<< ButtonRow("Refresh & Loadmore") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, row) in
                self.navigationController?.pushViewController(C4MVTMJDemoController(), animated: true)
            })
            <<< ButtonRow("FD UITableView Template") {
                $0.title = $0.tag
                }.onCellSelection({ (cell, row) in
                    self.navigationController?.pushViewController(C4MVTFDDemoController(), animated: true)
            })

            +++ Section("Dynamic Tab Demo")
            <<< ButtonRow("Add Last Tab") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, row) in
                C4MVTTabBarController.shared.addLast()
            })
            <<< ButtonRow("Remove Last Tab") {
                $0.title = $0.tag
            }.onCellSelection({ (cell, row) in
                C4MVTTabBarController.shared.removeLast()
            })

            +++ Section("Other Demo")
            <<< ButtonRow("Loading 3 seconds") {
                $0.title = $0.tag
                }.onCellSelection({ (cell, row) in
                    self.navigationController?.pushViewController(C4MVTLoadingDemoController(), animated: true)
                })
            <<< ButtonRow("Auto rotate vc") {
                $0.title = $0.tag
                }.onCellSelection({ (cell, row) in
                    self.navigationController?.pushViewController(C4MVTRotateDemoController(), animated: true)
                })

            +++ Section("Api Demo")
            <<< ButtonRow("Need Auth Api demo") {
                $0.title = $0.tag
                }.onCellSelection({ (cell, row) in
                    self.navigationController?.pushViewController(C4MVTNeedAuthApiDemoController(), animated: true)
                })
            <<< ButtonRow("No Need Auth Api demo") {
                $0.title = $0.tag
                }.onCellSelection({ (cell, row) in
                    self.navigationController?.pushViewController(C4MVTNoNeedAuthApiDemoController(), animated: true)
                })

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

    override var needLoadingCover: Bool {
        return false
    }

    // MARK: - Funtions
    override func viewDidLoad() {
        super.viewDidLoad()

        let vc = C4MVTSecondFormController(nibName: nil, bundle: nil)
        embeddedViewControllerToMain(vc)

        // try loading
        self.tryLoading()
    }

    fileprivate func render() {
        loadingSuccess()
    }

    override func loading() {
        // fake loading success
        render()
    }

}

