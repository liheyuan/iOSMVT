//
//  FDDemoCell.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/7.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit
import SnapKit

class FDDemoCell: UITableViewCell {

    fileprivate let padding: CGFloat = 10

    fileprivate lazy var wrapView: UIView = {
        return UIView()
    }()

    fileprivate lazy var idLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()

    fileprivate lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label    }()

    fileprivate lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.preferredMaxLayoutWidth = C4MVTGlobalConst.screenWidth - self.padding * 2
        return label
    }()


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        contentView.addSubview(wrapView)

        wrapView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }

        wrapView.addSubview(idLabel)
        wrapView.addSubview(nameLabel)
        wrapView.addSubview(contentLabel)

        idLabel.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(padding)
        }

        nameLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-padding)
            make.top.equalTo(idLabel)
        }

        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(idLabel.snp.bottom).offset(padding)
            make.centerX.bottom.equalToSuperview().offset(-padding)
        }

    }

    func bindWith(id: String, name: String, content: String) {
        idLabel.text = id
        nameLabel.text = name
        contentLabel.text = content
    }

}
