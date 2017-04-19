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
    var needLoginCover: Bool = true
    fileprivate var isLogin: Bool

    // MARK: - UI Getter
    fileprivate lazy var navBarView: C4MVTNavBarView = {
        let view = C4MVTNavBarView()
        return view
    }()

    fileprivate lazy var loginCoverView: UIView = {
        let view = C4MVTLoginView()
        return view
    }()

    fileprivate lazy var loadingCoverView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        return view
    }()

    fileprivate lazy var mainView: UIView = {
        let view = UIView()
        return view
    }()

    // MAKR: - Funtions
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        navBarType = .normal
        navBarTitle = "Title"
        isLogin = C4MVTAccountAgent.shared.isLoginCookieExist()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Notification
        if needLoginCover {
            c4mvt_listenNotification(name: C4MVTNotificationConst.LoginSuccess, sel: #selector(loginSuccessHandler(_:)))
            c4mvt_listenNotification(name: C4MVTNotificationConst.LogoutSuccess, sel: #selector(logoutSuccessHandler(_:)))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    deinit {
        c4mvt_unlistenAllNotification()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    fileprivate func setupUI() {
        setupNavigationBar()
        view.backgroundColor = UIColor.UI_background
        if canLoginSuccess() {
            setupAfterLoginSucc()
        } else {
            setupLoginCover()
        }
    }

    fileprivate func setupNavigationBar() {
        ///  Hidden system navigation bar
        self.navigationController?.setNavigationBarHidden(true, animated: false)

        ///  Setup navigation bar title
        view.addSubview(navBarView)
        navBarView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(C4MVTGlobalConst.navBarHeight)
        }
        navBarView.bind(with: navBarTitle,
                        leftIconType: navBarType == .home ? .none : .back)
    }

    fileprivate func setupLoginCover() {
        guard !canLoginSuccess() else {
                return
        }
        loginCoverView.removeFromSuperview()
        view.addSubview(loginCoverView)
        view.bringSubview(toFront: loginCoverView)
        loginCoverView.snp.makeConstraints { (make) in
            make.top.equalTo(navBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    fileprivate func setupAfterLoginSucc() {
        setupMain()
        setupLoadingCover()
    }

    fileprivate func setupLoadingCover() {
        loadingCoverView.removeFromSuperview()
        view.addSubview(loadingCoverView)
        view.bringSubview(toFront: loadingCoverView)
        loadingCoverView.snp.makeConstraints { (make) in
            make.top.equalTo(navBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    fileprivate func setupMain() {
        mainView.removeFromSuperview()
        view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.equalTo(navBarView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }

    fileprivate func canLoginSuccess() -> Bool {
        if !needLoginCover {
            return true
        } else {
            return isLogin
        }
    }

    // MARK: - Funtions for subclass
    func addSubviewToMain(_ subView: UIView) {
        mainView.addSubview(subView)
    }

    // Subclass should call this
    func tryLoading() {
        if canLoginSuccess() {
            loading()
        }
    }

    // Subclass should overwrite and never call this
    func loading() {
        fatalError("sub-class must override loading()")
    }

    func loadingFailed() {

    }

    func loadingSuccess() {
        loadingCoverView.isHidden = true
    }

    func makeToast(_ msg: String) {
        view.makeToast(msg)
    }

    func startLoadAnimating() {
        view.makeToastActivity(.center)
    }

    func stopLoadAnimating() {
        view.hideToastActivity()
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

// MARK: - Notification Handler
extension C4MVTBaseController {
    func loginSuccessHandler(_ notification: Notification) -> Void {
        isLogin = true
        loginCoverView.isHidden = true
        setupAfterLoginSucc()
        tryLoading()
        makeToast("Login success")
    }

    func logoutSuccessHandler(_ notification: Notification) -> Void {
        isLogin = false
        loginCoverView.isHidden = false
        setupLoginCover()
        makeToast("Logout success")
    }
}
