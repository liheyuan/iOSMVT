//
//  C4MVTGlobalConstants.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/5.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import UIKit

struct C4MVTGlobalConstants {

    static let C4MVT_1PX = 1.0 / UIScreen.main.scale
    static let IS_IOS8 = (UIDevice.current.systemVersion as NSString).doubleValue >= 8.0
    static let IS_IOS9 = (UIDevice.current.systemVersion as NSString).doubleValue >= 9.0
    static let IS_IOS10 = (UIDevice.current.systemVersion as NSString).doubleValue >= 10.0
    static let IS_IPAD = (UIDevice.current.userInterfaceIdiom == .pad)

}
