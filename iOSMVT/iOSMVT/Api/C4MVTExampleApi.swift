//
//  C4MVTExampleApi.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/11.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTExampleApi: C4MVTBaseApi {
    override func requestUrl() -> String {
        return "/post"
    }

    override func requestMethod() -> C4MVTApiRequestMethod {
        return .post
    }

    override func requestParameters() -> [String : Any] {
        return ["param1": "value1",
         "param2": "value2"]
    }

    override func requestHostType() -> C4MVTHostType {
        return .host2
    }
}
