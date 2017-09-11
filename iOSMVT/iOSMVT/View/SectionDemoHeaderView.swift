//
//  SectionDemoHeaderView.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/11.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

class SectionDemoHeaderView: UIView {

    fileprivate lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        backgroundColor = UIColor.UI_background
        titleLabel.textColor = UIColor.black

        addSubview(titleLabel)

        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    func bindWith(title: String) {
        titleLabel.text = title
    }

}
