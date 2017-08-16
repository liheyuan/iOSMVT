//
//  C4MVTNoNeedAuthApi.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/8/16.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTNoNeedAuthApi: C4MVTBaseApi {

    override func requestUrl() -> String {
        return "/test/noneedauth"
    }

    override func requestParameters() -> [String : Any] {
        return ["extra": "hahaha"]
    }
}
