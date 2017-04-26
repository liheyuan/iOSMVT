//
//  C4MVTNavBarView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/7.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

protocol C4MVTNavBarViewDelegate: NSObjectProtocol {
    func navBarDidPressLeftButton(_ view: C4MVTNavBarView)
    func navBarDidPressRightButton(_ view: C4MVTNavBarView)
}

class C4MVTNavBarView: UIView {

    // MARK: - Const
    fileprivate static let NavBarIconBGWidth: CGFloat = 40
    fileprivate static let NavBarIconWidth: CGFloat = 20
    fileprivate static let NavBarIconPadding: CGFloat = 12

    // MARK: - Property
    weak var delegate: C4MVTNavBarViewDelegate? = nil

    // MARK: - UI Getter
    private lazy var navBarTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    private lazy var navBarLeftBtn: UIButton = {
        let btn = UIButton()
        return btn
    }()

    private lazy var navBarRightBtn: UIButton = {
        let btn = UIButton()
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
        backgroundColor = .UI_blue

        addSubview(navBarTitleLabel)
        navBarTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.snp.bottom).offset(-22)
            make.centerX.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().offset(C4MVTNavBarView.NavBarIconBGWidth)
            make.trailing.lessThanOrEqualToSuperview().offset(-C4MVTNavBarView.NavBarIconBGWidth)
        }
        navBarTitleLabel.preferredMaxLayoutWidth = C4MVTGlobalConst.screenWidth - 2 * C4MVTNavBarView.NavBarIconBGWidth
        //
        navBarLeftBtn.addTarget(self, action: #selector(navBarLeftBtnPressed), for: .touchUpInside)
        navBarRightBtn.addTarget(self, action: #selector(navBarRightBtnPressed), for: .touchUpInside)
    }

    func bind(with title: String,
              leftIconType: C4MVTNavBarLeftIconType = .none,
              rightIconType: C4MVTNavBarRightIconType = .none) {
        ///  Setup title
        navBarTitleLabel.text = title

        ///  Setup left & right btn
        updateNavLeftBtn(iconType: leftIconType)
        updateNavRightBtn(iconType: rightIconType)
    }

    func updateNavLeftBtn(iconType: C4MVTNavBarLeftIconType) {
        navBarLeftBtn.removeFromSuperview()

        if iconType != .none {
            addSubview(navBarLeftBtn)

            navBarLeftBtn.snp.remakeConstraints({ (make) in
                make.centerY.equalTo(navBarTitleLabel)
                make.leading.equalToSuperview().offset(C4MVTNavBarView.NavBarIconPadding)
                make.height.width.equalTo(C4MVTNavBarView.NavBarIconWidth)
            })

            switch iconType {
            case .back:
                navBarLeftBtn.setImage(UIImage(named: "BackIcon"), for: UIControlState())
            case .close:
                navBarLeftBtn.setImage(UIImage(named: "CloseIcon"), for: UIControlState())
            default:
                break
            }
        }
    }

    func updateNavRightBtn(iconType: C4MVTNavBarRightIconType) {
        navBarRightBtn.removeFromSuperview()

        if iconType != .none {
            addSubview(navBarRightBtn)

            navBarRightBtn.snp.remakeConstraints({ (make) in
                make.centerY.equalTo(navBarTitleLabel)
                make.trailing.equalToSuperview().offset(-C4MVTNavBarView.NavBarIconPadding)
                make.height.width.equalTo(C4MVTNavBarView.NavBarIconWidth)
            })

            switch iconType {
            case .search:
                navBarRightBtn.setImage(UIImage(named: "SearchIcon"), for: UIControlState())
            case .share:
                navBarRightBtn.setImage(UIImage(named: "ShareIcon"), for: UIControlState())
            default:
                break
            }
        }
    }

    func updateTitle(title: String) {
        navBarTitleLabel.text = title
    }

}

// MARK: - Click
extension C4MVTNavBarView {

    func navBarLeftBtnPressed(sender: UIButton) {
        delegate?.navBarDidPressLeftButton(self)
    }

    func navBarRightBtnPressed(sender: UIButton) {
        delegate?.navBarDidPressRightButton(self)
    }
}
