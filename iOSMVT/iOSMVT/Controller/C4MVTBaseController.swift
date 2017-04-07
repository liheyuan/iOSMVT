//
//  C4MVTBaseController.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/6.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import SnapKit

enum C4MVTNavBarType {
    case home
    case normal
}

enum C4MVTNavBarLeftIconType {
    case none
    case back
    case close
}

enum C4MVTNavBarRightIconType {
    case none
    case search
    case share
}

class C4MVTBaseController: UIViewController {

    // MARK: - Const

    // MARK: - Property
    var navBarType: C4MVTNavBarType
    var navBarTitle: String

    // MARK: - UI Getter
    fileprivate lazy var navBarView: C4MVPNavBarView = {
        let view = C4MVPNavBarView()
        return view
    }()

    // MAKR: - Funtions
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        navBarType = .normal
        navBarTitle = "Title"
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    fileprivate func setupUI() {
        setupNavigationBar()
        view.backgroundColor = UIColor.UI_background
    }

    fileprivate func setupNavigationBar() {
        ///  Hidden system navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        ///  Setup navigation bar title
        view.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(C4MVTGlobalConstants.navBarHeight)
        }
        navBarView.bind(with: navBarTitle,
                        leftIconType: .back)
    }

}

// MARK: - Status Bar Config
extension C4MVTBaseController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        get {
            return .lightContent
        }
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        get {
            return .none
        }
    }

    override var prefersStatusBarHidden: Bool {
        get {
            return false
        }
    }
}
