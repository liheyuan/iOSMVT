//
//  C4MVTLoadingView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/27.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit
import FLAnimatedImage

protocol C4MVTLoadingViewDelegate: NSObjectProtocol {
    func loadingViewDidPressFailButton(_ view: C4MVTLoadingView)
}

class C4MVTLoadingView: UIView {

    // MARK: - Property
    weak var delegate: C4MVTLoadingViewDelegate? = nil
    fileprivate var loadFailInit: Bool = false

    // MARK: - UI Getter
    fileprivate lazy var loadingImageView: UIImageView = {
        let iv = FLAnimatedImageView()
        if let gifPath: String = Bundle.main.path(forResource: "Loading", ofType: "gif"),
            let gifData: Data = (try? Data(contentsOf: URL(fileURLWithPath: gifPath))) {
            iv.animatedImage = FLAnimatedImage(animatedGIFData: gifData)
        }
        return iv
    }()

    fileprivate lazy var loadFailControl: UIControl = {
        let c = C4MVTPageCenterControl()
        c.labelText = "Click to retry"
        c.iconImage = UIImage(named: "FailIcon")?.withRenderingMode(.alwaysTemplate)
        return c
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
        setupUIForLoading()
    }

    fileprivate func setupUIForLoading() {
        addSubview(loadingImageView)
        loadingImageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.size.equalTo(100)
        }
    }

    fileprivate func setupUIForFail() {
        if loadFailInit {
            return
        }

        addSubview(loadFailControl)
        loadFailControl.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        loadFailControl.addTarget(self, action: #selector(loadFailControlPressed), for: .touchUpInside)
        loadFailControl.isHidden = true
        loadFailInit = true
    }

    func switch2LoadingMode() {
        loadingImageView.isHidden = false
        loadFailControl.isHidden = true
    }

    func switch2FailMode() {
        setupUIForFail()
        loadingImageView.isHidden = true
        loadFailControl.isHidden = false
    }

    func loadFailControlPressed() {
        delegate?.loadingViewDidPressFailButton(self)
    }
}
