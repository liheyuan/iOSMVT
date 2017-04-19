//
//  C4MVTNeedAuthApi.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/18.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTNeedAuthApi: C4MVTBaseApi {

    override func requestUrl() -> String {
        return "/test/needauth"
    }

    override func requestParameters() -> [String : Any] {
        return ["username": "hehe"]
    }
}
