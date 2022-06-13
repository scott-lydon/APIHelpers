//
//  URL.swift
//  AnotherExperimentWithOpenAI
//
//  Created by Scott Lydon on 5/9/22.
//

import Foundation

public extension URL {

    /// Problem, could accidentally operate on a non-open ai url
    func openAIrequest(
        method: HTTPMethod,
        httpBody: [String: Any],
        headers: [String: String] = .header(.openAIapiKey)
    ) -> URLRequest {
        assert(
            headers["Authorization"]?.contains(String.noAPIKeyProvided) == false,
            "You need to assign the api key like so: `String.openAIapiKey = yourKey`"
        )
        var request = URLRequest(url: self)
        request.allHTTPHeaderFields = headers
        request.httpMethod = method.rawValue
        request.httpBody = httpBody.jsonData
        return request
    }
}

public extension Dictionary where Key == String, Value == String {

    static func header(_ apiKey: String) -> Self {
        [
            "Authorization": "Bearer \(apiKey)",
            "Content-Type": "application/json"
        ]
    }
}

public extension String {
    static var openAIapiKey: String = .noAPIKeyProvided
    static let noAPIKeyProvided: String = "no api key provided"
}
