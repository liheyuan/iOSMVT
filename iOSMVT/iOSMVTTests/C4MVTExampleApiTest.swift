//
//  C4MVTExampleApiTest.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/11.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import iOSMVT

class C4MVTExampleApiTest: XCTestCase {

    var currentExpectaion: XCTestExpectation?
    
    func testExample() {
        currentExpectaion = expectation(description: "wait for api response")

        let api = C4MVTExampleApi()
        api.delegate = self
        api.start()
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
}

extension C4MVTExampleApiTest: C4MVTBaseApiDelegate {
    func requestFailed(api: C4MVTBaseApi,
                       err: C4MVTApiErrorType) {
        currentExpectaion?.fulfill()
    }

    func requestSuccess(api: C4MVTBaseApi) {
        debugPrint(api.responseString)
        let sample: SampleObject? = api.mapToObject()
        debugPrint(sample ?? "nil")
        currentExpectaion?.fulfill()
    }
}
