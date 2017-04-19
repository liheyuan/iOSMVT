//
//  C4MVTHostConst.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/12.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

enum C4MVTHostType {
    case host1
    case host2
}

struct C4MVTHostConst {

    static func getHostUrlBy(type: C4MVTHostType) -> String {
        switch type {
        case .host1:
            return "http://api.coder4.com"
        case .host2:
            return "https://httpbin.org"
        }
    }

}
