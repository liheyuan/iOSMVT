//
//  C4MVTGlobalConst.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

struct C4MVTGlobalConst {

    static let c4mvt_1PX: CGFloat = 1.0 / UIScreen.main.scale
    static let statusBarHeight: CGFloat = 20
    static let navBarHeight: CGFloat = 64
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height

    static let IS_IOS8 = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
    static let IS_IOS9 = (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0
    static let IS_IOS10 = (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0
    static let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)

}
