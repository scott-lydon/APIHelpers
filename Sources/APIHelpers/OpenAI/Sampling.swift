//
//  Sampling.swift
//  AnotherExperimentWithOpenAI
//
//  Created by Scott Lydon on 5/9/22.
//

import Foundation

public enum Sampling: Hashable {
    
    /// Higher values means the model will take more risks.
    /// Try 0.9 for more creative applications,
    /// and 0 (argmax sampling) for ones with a well-defined answer.
    case temperature(Double)

    /// The model considers the results of the tokens with top_p probability mass.
    /// So 0.1 means only the tokens comprising the top 10% probability mass are considered.
    case nucleus(Double)
}
