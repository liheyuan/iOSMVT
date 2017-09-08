//
//  SeperatorUtil.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/9/8.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

enum SeperatorLocation {
    case top
    case bottom
}

class SeperatorUtil {

    public static func addSeperator(to parentView: UIView, at location: SeperatorLocation, leftPadding: CGFloat = 0, rightPadding: CGFloat = 0) {
        let seperatorView = makeSeperator()
        parentView.addSubview(seperatorView)

        seperatorView.snp.makeConstraints { (make) in
            if location == .top {
                make.top.equalToSuperview()
            } else {
                make.bottom.equalToSuperview()
            }
            make.leading.equalToSuperview().offset(leftPadding)
            make.trailing.equalToSuperview().offset(-rightPadding)
            make.height.equalTo(C4MVTGlobalConst.c4mvt_1PX)
        }
    }

    private static func makeSeperator() -> UIView {
        let v = UIView()
        v.backgroundColor = UIColor.UI_boundry
        return v
    }

}
