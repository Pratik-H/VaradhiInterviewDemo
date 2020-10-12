//
//  AppConfiguration.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire

final class AppConfiguration {

    // MARK: - URLS
    struct URLS {
        static let apiBaseURL = URL(string: Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as! String)
        static let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as! String
        
        static let imageBaseURL = URL(string: Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as! String)
        
        static let imageBaseURLString = Bundle.main.object(forInfoDictionaryKey: "ImageBaseURL") as! String
    }
    
    
    // MARK: - Methods
    class func networkReachability() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}

