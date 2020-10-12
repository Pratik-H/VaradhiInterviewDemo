//
//  VS_CommonMethods.swift
//  VaradhiInterviewDemo
//
//  Created by Neosoft on 12/10/20.
//  Copyright © 2020 Pratik. All rights reserved.
//

import Foundation

func convertModelToJSON<T: Codable>(model: T) -> [String: Any]? {
    do {
        let data = try JSONEncoder().encode(model)
        let object = try JSONSerialization.jsonObject(with: data)
        return object as? [String: Any]
    } catch {
        return nil
    }
}
