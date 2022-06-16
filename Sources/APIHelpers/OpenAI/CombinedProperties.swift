//
//  CombinedProperties.swift
//  AnotherExperimentWithOpenAI
//
//  Created by Scott Lydon on 5/9/22.
//

import Foundation

public struct CombinedProperties {

    public let urlString: String
    public let method: HTTPMethod
    public let httpBody: [String: Any]

    public init(
        urlString: String,
        method: HTTPMethod,
        httpBody: [String: Any]
    ) {
        self.urlString = urlString
        self.method = method
        self.httpBody = httpBody
    }

    public func request(apiKey: String = .openAIapiKey) -> URLRequest? {
        urlString.url?.openAIrequest(
            method: method,
            httpBody: httpBody,
            headers: .header(apiKey)
        )
    }

    // MARK: - Examples

    static func tarotCardConversionRequest(
        text: String = "Tacos are great.  I can't tell you how much I love tacos."
    ) ->  Self {
        CombinedProperties.edit(
            text: text,
            editCount: 3,
            howToEdit: "Rewrite with an encouraging, wise tone.  Must include the original subjects and objects."
        )
    }

    /// https://beta.openai.com/docs/api-reference/edits
    static func edit(
        text: String,
        editCount: Int,
        howToEdit: String = "Fix the spelling mistakes",
        characterAllowance: Int = 1000
    ) -> Self {
        .init(
            urlString: "https://api.openai.com/v1/edits",
            method: .post,
            httpBody: [
                "model": "text-davinci-edit-001",
                "input": text,
                "instruction": howToEdit,
                "n": editCount
            ]
        )
    }

    /// Translates plain language into a sql query.
    /// https://beta.openai.com/examples/default-sql-translate
    static func create(
        engine: OpenEngine,
        prompt: String,
        characterAllowance: Int = 1000
    ) -> Self {
        .init(
            urlString: "https://api.openai.com/v1/engines/\(engine.string)/completions",
            method: .post,
            httpBody: .completionDictionary(
                prompt: prompt,
                sampling: .temperature(0),
                numberOfTokens: ...characterAllowance,
                stop: ["#", ";"],
                user: nil,
                presencePenalty: 0,
                frequencyPenalty: 0,
                bestOf: nil
            )
        )
    }
    
    /// Translates plain language into a sql query.
    /// https://beta.openai.com/examples/default-sql-translate
    static var vapor: Self {
        .init(
            urlString: "https://api.openai.com/v1/engines/code-davinci-002/completions",
            method: .post,
            httpBody: .completionDictionary(
                prompt:
                    """
                    ### Postgres SQL tables, with their properties:
                    #
                    # Employee(id, name, department_id)
                    # Department(id, name, address)
                    # Salary_Payments(id, employee_id, amount, date)
                    #
                    ### Using Vapor, the Swift backend framework, an endpoint that query to list the names of the departments which employed more than 10 employees in the last 3 months.
                    import Vapor
                    """
                ,
                sampling: .temperature(0),
                numberOfTokens: ...1000,
                stop: ["#", ";"],
                user: nil,
                presencePenalty: 0,
                frequencyPenalty: 0,
                bestOf: nil
            )
        )
    }

    /// Notice that when we add a sentence which requests full unit test coverage, the actual code is no longer included...Only the final sentence is followed.
    /// https://beta.openai.com/examples/default-sql-translate
    static var vaporOddPhenomena: Self {
        .init(
            urlString: "https://api.openai.com/v1/engines/code-davinci-002/completions",
            method: .post,
            httpBody: .completionDictionary(
                prompt:
                    """
                    ### Postgres SQL tables, with their properties:
                    #
                    # Employee(id, name, department_id)
                    # Department(id, name, address)
                    # Salary_Payments(id, employee_id, amount, date)
                    #
                    ### Using Vapor, the Swift backend framework, an endpoint that query to list the names of the departments which employed more than 10 employees in the last 3 months. In addition, cover the code with 100% unit test coverage using the XCTestCase framework.
                    import Vapor
                    """
                ,
                sampling: .temperature(0),
                numberOfTokens: ...1200,
                stop: ["#", ";"],
                user: nil,
                presencePenalty: 0,
                frequencyPenalty: 0,
                bestOf: nil
            )
        )
    }

    /// Translates plain language into a sql query.
    /// https://beta.openai.com/examples/default-sql-translate
    static var sqlTranslate: Self {
        .init(
            urlString: "https://api.openai.com/v1/engines/code-davinci-002/completions",
            method: .post,
            httpBody: .completionDictionary(
                prompt:
                    """
                    ### Postgres SQL tables, with their properties:
                    #
                    # Employee(id, name, department_id)
                    # Department(id, name, address)
                    # Salary_Payments(id, employee_id, amount, date)
                    #
                    ### A query to list the names of the departments which employed more than 10 employees in the last 3 months
                    SELECT
                    """
                ,
                sampling: .temperature(0),
                numberOfTokens: ...150,
                stop: ["#", ";"],
                user: nil,
                presencePenalty: 0,
                frequencyPenalty: 0,
                bestOf: nil
            )
        )
    }

    /// Prints out something to do with Grapheme. or something.
    static var myOwnTest: Self {
        .init(
            urlString: "https://api.openai.com/v1/engines/\(OpenEngine.davinci.rawValue.string)/completions",
            method: .post,
            httpBody: .completionDictionary(
                prompt: "Say 'test', but, print it in spanish",
                sampling: .temperature(0.0),
                numberOfTokens: ...256,
                numberOfCompletions: 1,
                echo: false,
                stop: ["//"],
                presencePenalty: 0.0,
                frequencyPenalty: 0.0,
                bestOf: 1
            )
        )
    }
}
