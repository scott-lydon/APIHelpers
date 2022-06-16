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

extension URLString: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        string = value.replacingOccurrences(of: "_", with: "-")
    }
}
