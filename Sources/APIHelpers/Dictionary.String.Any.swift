//
//  File.swift
//  
//
//  Created by Scott Lydon on 6/15/22.
//

import Foundation

public extension Dictionary where Key == String, Value == Any {

    var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: self)
    }
}
