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

    fileprivate lazy var loadFailWrapView: UIView = {
        let v = UIView()
        return v
    }()

    fileprivate lazy var loadFailImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "FailIcon")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.UI_blue
        return iv
    }()

    fileprivate lazy var loadFailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.UI_blue
        label.text = "Click To Refresh"
        return label
    }()

    fileprivate lazy var loadFailBtn: UIButton = {
        return UIButton()
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

        addSubview(loadFailWrapView)
        loadFailWrapView.addSubview(loadFailImageView)
        loadFailWrapView.addSubview(loadFailLabel)
        loadFailWrapView.addSubview(loadFailBtn)
        loadFailWrapView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        loadFailBtn.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        loadFailBtn.addTarget(self, action: #selector(loadFailBtnPressed), for: .touchUpInside)
        loadFailImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.size.size.equalTo(100)
        }
        loadFailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(loadFailImageView.snp.bottom).offset(20)
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        loadFailWrapView.isHidden = true
        loadFailInit = true
    }

    func switch2LoadingMode() {
        loadingImageView.isHidden = false
        loadFailWrapView.isHidden = true
    }

    func switch2FailMode() {
        setupUIForFail()
        loadingImageView.isHidden = true
        loadFailWrapView.isHidden = false
    }

    func loadFailBtnPressed() {
        delegate?.loadingViewDidPressFailButton(self)
    }
}
