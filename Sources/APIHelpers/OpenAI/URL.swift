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
