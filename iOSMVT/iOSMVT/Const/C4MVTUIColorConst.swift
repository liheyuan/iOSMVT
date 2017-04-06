//
//  C4MVTUIColorConst.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import UIKit

extension UIColor {

    static let UI_blue = UIColor(rgbValue: 0x006dcc)
    static let UI_boundry = UIColor(rgbValue: 0xe7e7e7)
    static let UI_background = UIColor(rgbValue: 0xf3f4f5)

    // MARK: - Funtions
    convenience init(rgbValue: UInt) {
        self.init(rgbValue: rgbValue, alpha: 1.0)
    }

    convenience init?(rgbString: String) {
        var value64: UInt64 = 0
        Scanner(string: rgbString).scanHexInt64(&value64)
        if let value = UInt(exactly:value64) {
            self.init(rgbValue: UInt(value), alpha: 1.0)
        } else {
            return nil
        }
    }

    convenience init(rgbValue: UInt, alpha: CGFloat) {
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }

}
