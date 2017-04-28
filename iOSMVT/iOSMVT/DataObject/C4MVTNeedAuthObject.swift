//
//  C4MVTNeedAuthObject.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/28.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import ObjectMapper

class C4MVTNeedAuthObject: Mappable {
    var msg: String?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        msg <- map["msg"]
    }
}
