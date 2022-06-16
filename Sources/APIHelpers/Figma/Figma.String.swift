//
//  String.swift
//  APIs
//
//  Created by Scott Lydon on 6/12/22.
//

import Foundation

public extension String {

    /// Gets the url string for attempting to retrieve your Figma board as JSON.
    /// - Parameter board: your board's id
    /// - Returns: returns the url string.
    static func figma(board: String) -> String {
        "https://api.figma.com/v1/files/" + board
    }
}
