//
//  VS_API_Router.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire

typealias AnyDict = [String: Any]
enum VS_API_Router: URLRequestConvertible {
   typealias urls = AppConfiguration.URLS
    
    // MARK: - APIs
     case get_monthly_appointments(AnyDict)
    
    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
            case .get_monthly_appointments:
                return .post
        }
    }
    
    
    // MARK: - Path
    var path: String {
        switch self {
            case .get_monthly_appointments:
                return "marketing/get_monthly_appointments"
        }
    }
    
    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
            case  .get_monthly_appointments(let AnyDict):
                return AnyDict
        }
    }

    var absolutePath: String {
        switch self {
            default:
                return "\(urls.apiBaseURLString)\(path)"
        }
    }
    // MARK: - Encoder
    var encoding: ParameterEncoding {
        switch self {
            case .get_monthly_appointments:
                return URLEncoding.default
//            default:
//                return JSONEncoding.default
        }
    }
    
    // MARK: - Header
    var headers: HTTPHeaders? {
        let headersDict = HTTPHeaders()
        switch self {
            default:
                return headersDict
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        guard let url = try urls.apiBaseURL?.asURL() else {
            fatalError("BASE URL NOT FOUND")
        }
        var request = URLRequest(url: url.appendingPathComponent(path))
        request.httpMethod = method.rawValue
        request.timeoutInterval = TimeInterval(10 * 1000)
        return try URLEncoding.default.encode(request, with: parameters)
    }
    
}
