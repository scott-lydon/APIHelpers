//
//  File.swift
//  
//
//  Created by Scott Lydon on 6/16/22.
//

import Foundation

// MARK: - Welcome
public struct OpenAIEditResponse: Codable {
    let object: String
    let created: Int
    let choices: [Choice]
}

// MARK: - Choice
public struct Choice: Codable {
    let text: String
    let index: Int
}
