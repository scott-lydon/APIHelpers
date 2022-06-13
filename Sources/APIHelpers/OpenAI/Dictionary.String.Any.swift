//
//  Dictionary.String.Any.swift
//  AnotherExperimentWithOpenAI
//
//  Created by Scott Lydon on 5/9/22.
//

import Foundation



public extension Dictionary where Key == String, Value == Any {

    /**
     Helps produce a dictionary for the http body
     - Parameters:
     - prompt:string or array, Optional, Defaults to '<|endoftext|>' The prompt(s) to generate completions for, encoded as a string, array of strings, array of tokens, or array of token arrays. Note that <|endoftext|> is the document separator that the model sees during training, so if a prompt is not specified the model will generate as if from the beginning of a new document.
     - sampling: temperature, number, Optional, Defaults to 1 What sampling temperature to use. Higher values means the model will take more risks. Try 0.9 for more creative applications, and 0 (argmax sampling) for ones with a well-defined answer. We generally recommend altering this or top_p but not both.
     top_p number, Optional, Defaults to 1 An alternative to sampling with temperature, called nucleus sampling, where the model considers the results of the tokens with top_p probability mass. So 0.1 means only the tokens comprising the top 10% probability mass are considered. We generally recommend altering this or temperature but not both.
     - numberOfTokens: n, integer, Optional, Defaults to 1 How many completions to generate for each prompt. Note: Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for max_tokens and stop.
     - numberOfCompletions: max_tokens, integer, Optional, Defaults to 16, The maximum number of tokens to generate in the completion. The token count of your prompt plus max_tokens cannot exceed the model's context length. Most models have a context length of 2048 tokens (except for the newest models, which support 4096).
     - echo: echo, boolean, Optional, Defaults to false Echo back the prompt in addition to the completion
     - stop: stop, string or array,  Optional, Defaults to null Up to 4 sequences where the API will stop generating further tokens. The returned text will not contain the stop sequence.
     - user: user, string, Optional A unique identifier representing your end-user, which will help OpenAI to monitor and detect abuse.
     - presencePenalty: presence_penalty, number, Optional, Defaults to 0 Number between -2.0 and 2.0. Positive values penalize new tokens based on whether they appear in the text so far, increasing the model's likelihood to talk about new topics. See more information about frequency and presence penalties.
     - frequencyPenalty: frequency_penalty, number, Optional, Defaults to 0 Number between -2.0 and 2.0. Positive values penalize new tokens based on their existing frequency in the text so far, decreasing the model's likelihood to repeat the same line verbatim. See more information about frequency and presence penalties.
     - bestOf: best_of, integer, Optional, Defaults to 1 Generates best_of completions server-side and returns the "best" (the one with the lowest log probability per token). Results cannot be streamed. When used with n, best_of controls the number of candidate completions and n specifies how many to return – best_of must be greater than n. Note: Because this parameter generates many completions, it can quickly consume your token quota. Use carefully and ensure that you have reasonable settings for max_tokens and stop.
     - Returns: a dictionary that you can convert to JSON for the open ai endpoint.
     */
    static func completionDictionary(
        prompt: String? = nil,
        sampling: Sampling? = .temperature(0.0),
        numberOfTokens: PartialRangeThrough<Int>? = ...256,
        numberOfCompletions: Int? = 1,
        echo: Bool? = true,
        stop: [String]? = ["//"],
        user: String? = nil,
        presencePenalty: Double? = 0.0,
        frequencyPenalty: Double? = 0.0,
        bestOf: Int? = 1
    ) -> Self {
        var parameters: Self = [:]
        parameters["prompt"] = prompt
        parameters["max_tokens"] = numberOfTokens?.upperBound
        parameters["n"] = numberOfCompletions
        parameters["echo"] = echo
        parameters["stop"] = stop
        parameters["user"] = user
        parameters["presence_penalty"] = presencePenalty
        parameters["frequency_penalty"] = frequencyPenalty
        parameters["best_of"] = bestOf

        switch sampling {
        case .temperature(let temperature)?:
            parameters["temperature"] = temperature
        case .nucleus(let percentage)?:
            parameters["top_p"] = percentage
        default:
            break
        }
        return parameters
    }

    var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: self)
    }
}
