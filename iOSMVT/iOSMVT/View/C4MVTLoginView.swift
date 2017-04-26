//
//  C4MVTLoginView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/15.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit
import ToastSwiftFramework

class C4MVTLoginView: UIView {

    // MARK: - UI Getter
    fileprivate lazy var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Logo")
        iv.contentMode = .scaleAspectFit
        return iv
    }()

    fileprivate lazy var usernameField: UITextField = {
        let field = C4MVTTextField()
        field.placeholder = "iOSMVT Username"
        return field
    }()

    fileprivate lazy var passwordField: UITextField = {
        let field = C4MVTTextField()
        field.placeholder = "iOSMVT Password"
        field.isSecureTextEntry = true
        return field
    }()

    fileprivate lazy var loginBtn: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .UI_blue
        btn.setTitle("Login iOSMVT", for: UIControlState())
        btn.titleLabel?.textColor = .white
        return btn
    }()

    // MARK: - Funtions
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    fileprivate func setupUI() {
        backgroundColor = UIColor.UI_background

        addSubview(logoImageView)
        addSubview(usernameField)
        addSubview(passwordField)
        addSubview(loginBtn)

        logoImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(40)
            make.leading.trailing.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
        }

        usernameField.snp.makeConstraints { (make) in
            make.top.equalTo(logoImageView.snp.bottom).offset(40)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(45)
        }

        passwordField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameField)
            make.height.equalTo(45)
        }

        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(passwordField.snp.bottom).offset(40)
            make.leading.trailing.equalTo(usernameField)
            make.height.equalTo(45)
        }
        loginBtn.addTarget(self, action: #selector(loginBtnPressed), for: .touchUpInside)
    }

    func loginBtnPressed() {
        C4MVTAccountAgent.shared.login(user: usernameField.text ?? "",
                                       pass: passwordField.text ?? "") { (succ) in
                                        if succ {
                                            C4MVTTabBarController.shared.addLast()
                                        }
        }
    }

}
