//
//  String.swift
//  
//
//  Created by Scott Lydon on 6/15/22.
//

import Foundation

extension String {
    var url: URL? {
        URL(string: self)
    }
}
