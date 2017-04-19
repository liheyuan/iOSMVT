//
//  C4MVTLoginApi.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/17.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTLoginApi: C4MVTBaseApi {

    fileprivate var userName: String
    fileprivate var passHash: String

    init(userName: String,
         passHash: String) {
        self.userName = userName
        self.passHash = passHash
    }

    override func requestUrl() -> String {
        return "/account/login"
    }

    override func requestMethod() -> C4MVTApiRequestMethod {
        return .post
    }

    override func requestParameters() -> [String : Any] {
        return ["username": userName,
                "passhash": passHash]
    }

    func getUser() -> C4MVTUserObject? {
        return mapToObject()
    }
}
