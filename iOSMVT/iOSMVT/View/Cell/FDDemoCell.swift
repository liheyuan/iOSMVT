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

    fileprivate let Section1Color: UIColor = UIColor(rgbValue: 0x000000)

    fileprivate let Section2Color: UIColor = UIColor(rgbValue: 0x00ff00)

    fileprivate let Section3Color: UIColor = UIColor(rgbValue: 0x0000ff)


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
        SeperatorUtil.addSeperator(to: wrapView, at: .bottom, leftPadding: 10)

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
            make.leading.trailing.equalToSuperview().inset(padding)
        }

    }

    func bindWith(id: String, name: String, content: String, section: Int = 0) {
        idLabel.text = id
        nameLabel.text = name
        contentLabel.text = content

        switch section {
        case 0:
            idLabel.textColor = self.Section1Color
            nameLabel.textColor = self.Section1Color
            contentLabel.textColor = self.Section1Color
        case 1:
            idLabel.textColor = self.Section2Color
            nameLabel.textColor = self.Section2Color
            contentLabel.textColor = self.Section2Color
        case 2:
            idLabel.textColor = self.Section3Color
            nameLabel.textColor = self.Section3Color
            contentLabel.textColor = self.Section3Color
        default:
            break
        }
    }

}
