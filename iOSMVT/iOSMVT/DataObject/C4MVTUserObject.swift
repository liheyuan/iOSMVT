//
//  C4MVTUserObject.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/17.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import ObjectMapper

class C4MVTUserObject: Mappable {
    var userId: Int?
    var userName: String?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        userName <- map["userName"]
        userId   <- map["userId"]
    }
}
