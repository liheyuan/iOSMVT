//
//  SampleObject.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/13.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import ObjectMapper

class SampleObject: Mappable {
    var origin: String?
    var url: Int?

    required init?(map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
        origin    <- map["origin"]
        url       <- map["url"]
    }
}
