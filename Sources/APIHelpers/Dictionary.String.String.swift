//
//  Dictionary.String.String.swift
//  
//
//  Created by Scott Lydon on 6/15/22.
//

import Foundation

public extension Dictionary where Key == String, Value == String {

    static func header(_ apiKey: String) -> Self {
        [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
    }
}
