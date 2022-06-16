//
//  OpenAI.URLRequest.swift
//  
//
//  Created by Scott Lydon on 6/15/22.
//

import Foundation

public extension URLRequest {

    init?(combinedProperties: CombinedProperties, apiKey: String = .openAIapiKey) {
        if let request = combinedProperties.request(apiKey: apiKey) {
            self = request
        } else {
            return nil
        }
    }
}
