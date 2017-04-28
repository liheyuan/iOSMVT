//
//  C4MVTPageCenterControl.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/28.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

class C4MVTPageCenterControl: UIControl {
    // MARK: - Const
    fileprivate static let normalColor: UIColor = UIColor.UI_blue
    fileprivate static let highlightedColor: UIColor = UIColor.UI_blue.withAlphaComponent(0.8)

    // MARK: - Property
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                iconImageView.tintColor = C4MVTPageCenterControl.highlightedColor
                textLabel.textColor = C4MVTPageCenterControl.highlightedColor
            } else {
                iconImageView.tintColor = C4MVTPageCenterControl.normalColor
                textLabel.textColor = C4MVTPageCenterControl.normalColor
            }
        }
    }

    var labelText: String {
        didSet {
            textLabel.text = labelText
        }
    }

    var iconImage: UIImage? {
        didSet {
            iconImageView.image = iconImage
        }
    }

    // MARK: - UI Getter
    fileprivate lazy var iconImageView: UIImageView = {
        let iv = UIImageView()
        // iv.image = UIImage(named: "FailIcon")?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = UIColor.UI_blue
        return iv
    }()

    fileprivate lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor.UI_blue
        return label
    }()

    // MARK: - Funtions
    override init(frame: CGRect) {
        iconImage = nil
        labelText = ""
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        addSubview(iconImageView)
        addSubview(textLabel)
        iconImageView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(100)
        }
        textLabel.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView.snp.bottom).offset(20)
            make.leading.greaterThanOrEqualToSuperview()
            make.trailing.lessThanOrEqualToSuperview()
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
    }


}
