//
//  C4MVTBaseApi.swift
//  iOSMVT
//
//  Created by Heyuan Li on 2017/4/7.
//  Copyright © 2017年 Coder4. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum C4MVTApiRequestMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

enum C4MVTApiRequestParameterEncoding {
    case defaultEncoding
    case jsonEncoding
}

enum C4MVTApiErrorType {
    case requestUrlError
    case requestParamError
    case responseCodeError(code: Int)
    case responseError
    case unknownError
}

protocol C4MVTBaseApiDelegate: NSObjectProtocol {

    func requestFailed(api: C4MVTBaseApi,
                       err: C4MVTApiErrorType)

    func requestSuccess(api: C4MVTBaseApi)
}

class C4MVTBaseApi: NSObject {

    // MARK: - Property
    weak var delegate: C4MVTBaseApiDelegate? = nil
    var responseString: String = ""
    var statusCode: Int = 0

    // MARK: - Funtion for call
    func start() {
        Alamofire.request(getRequestUrl(),
                          method: getRequestMethod(),
                          parameters: requestParameters(),
                          encoding: getRequestEncoding(),
                          headers: nil)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseString(completionHandler: { (response) in

                self.statusCode = response.response?.statusCode ?? 0

                switch response.result {
                case .success(let value):
                    self.responseString = value
                    self.delegate?.requestSuccess(api: self)
                    return
                case .failure(let error):
                    var err: C4MVTApiErrorType = .unknownError
                    if let error = error as? AFError {
                        switch error {
                        case.invalidURL:
                            err = .requestUrlError
                            break
                        case .parameterEncodingFailed:
                            err = .requestParamError
                            break
                        case .multipartEncodingFailed:
                            err = .requestParamError
                            break
                        case .responseValidationFailed(let reason):
                            switch reason {
                            case .unacceptableStatusCode(let responseCode):
                                err = .responseCodeError(code: responseCode)
                            default:
                                err = .responseError
                            }
                            break
                        case .responseSerializationFailed:
                            err = .responseError
                        }
                    }
                    self.delegate?.requestFailed(api: self, err: err)
                    break
                }
        })
    }

    func mapToObject<T: Mappable>() -> T? {
        return Mapper<T>().map(JSONString: responseString)
    }

    func mapToArray<T: Mappable>() -> [T]? {
        return Mapper<T>().mapArray(JSONString: responseString)
    }

    // MARK: - Funtions can be overwrite
    func requestUrl() -> String {
        fatalError("sub-class must override requestUrl()")
    }

    func requestHostType() -> C4MVTHostType {
        return .host1
    }

    func requestParameters() -> [String: Any] {
        return [String: Any]()
    }

    func requestMethod() -> C4MVTApiRequestMethod {
        return .get
    }

    func requestParameterEncoding() -> C4MVTApiRequestParameterEncoding {
        return .defaultEncoding
    }

    // MARK: - Private func
    fileprivate func getRequestUrl() -> String {
        return C4MVTHostConst.getHostUrlBy(type: requestHostType()) + requestUrl()
    }

    fileprivate func getRequestMethod() -> HTTPMethod {
        let methodStr = requestMethod().rawValue
        guard let method = HTTPMethod(rawValue: methodStr) else {
            return .get
        }
        return method
    }

    fileprivate func getRequestEncoding() -> ParameterEncoding {
        switch requestParameterEncoding() {
        case .defaultEncoding:
            return URLEncoding.default
        case .jsonEncoding:
            return JSONEncoding.default
        }
    }




}
