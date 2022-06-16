//
//  File.swift
//  
//
//  Created by Scott Lydon on 6/15/22.
//

import Foundation

public struct URLString: Equatable {
    var string: String
}

public extension URLString: ExpressibleByStringLiteral {
    init(stringLiteral value: StringLiteralType) {
        string = value.replacingOccurrences(of: "_", with: "-")
    }
}
