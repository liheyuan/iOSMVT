//
//  C4MVTAccountAgent.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/17.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTAccountAgent: NSObject {

    static let shared: C4MVTAccountAgent =  C4MVTAccountAgent()

    fileprivate var userId: String = ""

    fileprivate override init() {
    }

    func isLogin() -> Bool {
        return userId != ""
    }

    func isLoginCookieExist() -> Bool {
        return getCookie(key: "jwt_auth") != nil
    }

    func login(user: String,
               pass: String,
               animatingTarget: C4MVTBaseApiAnimatingTarget? = nil,
               succ: ((Bool) -> Void)? = nil) {
        guard let passHash: String = C4MVTHashUtil.sha256("C4MVT_\(pass)")?.lowercased() else {
            succ?(false)
            return
        }

        let api = C4MVTLoginApi(userName: user,
                                passHash: passHash)
        api.animatingTarget = animatingTarget
        api.startWithCallback(succ: { 
            // succ
            succ?(true)

            self.c4mvt_postNotification(name: C4MVTNotificationConst.LoginSuccess, userInfo: nil)

        }) { (errType) in
            // fail
            succ?(false)
        }
    }

    func logout() {
        cleanAllCookie()
        self.c4mvt_postNotification(name: C4MVTNotificationConst.LogoutSuccess, userInfo: nil)
    }

    // MARK: - Cookie related
    fileprivate func cleanAllCookie() {
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return
        }

        for cookie in cookies {
            HTTPCookieStorage.shared.deleteCookie(cookie)
        }
    }

    fileprivate func getCookie(key: String) -> String? {
        guard let url = URL(string: C4MVTHostConst.getHostUrlBy(type: .host1)) else {
            return nil
        }
        guard let cookies = HTTPCookieStorage.shared.cookies(for: url) else {
            return nil
        }
        for cookie in cookies {
            if cookie.name == key {
                return cookie.value;
            }
        }
        return nil
    }

}
