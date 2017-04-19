//
//  C4MVTHashUtil.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/17.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation

class C4MVTHashUtil {
    static func hexString(_ data: Data) -> String {
        return data.map{String(format: "%02X", Int($0))}.joined()
    }

    static func sha256(_ data: Data) -> Data? {
        guard let res = NSMutableData(length: Int(CC_SHA256_DIGEST_LENGTH)) else { return nil }
        CC_SHA256((data as NSData).bytes, CC_LONG(data.count), res.mutableBytes.assumingMemoryBound(to: UInt8.self))
        return res as Data
    }

    static func sha256(_ str: String) -> String? {
        guard
            let data = str.data(using: String.Encoding.utf8),
            let shaData = sha256(data)
            else { return nil }
        return hexString(shaData)
    }
}
