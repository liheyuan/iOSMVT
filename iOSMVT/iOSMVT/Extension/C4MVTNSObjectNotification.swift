//
//  C4MVTNSObjectNotification.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/19.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

extension NSObject {
    func c4mvt_listenNotification(name: String,
                                  sel: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: sel,
                                               name: NSNotification.Name(name),
                                               object: nil)
    }

    func c4mvt_postNotification(name: String,
                                userInfo: [AnyHashable : Any]?) {
        NotificationCenter.default.post(name: NSNotification.Name(name),
                                        object: nil,
                                        userInfo: userInfo)
    }

    func c4mvt_unlistenAllNotification() {
        NotificationCenter.default.removeObserver(self)
    }

    func c4mvt_unlistenNotification(name: String) {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(name), object: nil)
    }
}
