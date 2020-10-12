//
//  VS_API_Client.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD
class VS_API_Client {
    
    /// Fetches Data from the server
    /// - Parameter url: convertable url
    /// - Parameter callback: fetch result
    class func getData(ofURL url: VS_API_Router, callback: @escaping (Result<Data, Error>) -> Void) {
        if AppConfiguration.networkReachability() == true {
            
            AF.request(url.absolutePath, method: url.method,
                       parameters: url.parameters,
                       encoding: url.encoding,
                       headers: url.headers).validate(statusCode: 200...500).responseJSON { response in
                        
                        //                                                print("\(response)")
                        switch response.result {
                            case .success:
                                if let data = response.data {
                                    callback(.success(data))
                            }
                            
                            case .failure(let error):
                                callback(.failure(error))
                        }
            }
        } else {
            print("Applicatoin is offline")
        }
    }
    
}
