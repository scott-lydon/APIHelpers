//
//  OpenEngine.swift
//  AnotherExperimentWithOpenAI
//
//  Created by Scott Lydon on 5/9/22.
//

import Foundation


/// Interesting website: https://openai.com/blog/introducing-text-and-code-embeddings/
public enum OpenEngine: URLString {

    var string: String {
        rawValue.string
    }

    /// Ada is usually the fastest model and can perform tasks like parsing text, address correction and certain kinds of classification tasks that don’t require too much nuance. Ada’s performance can often be improved by providing more context. Good at: Parsing text, simple classification, address correction, keywords Note: Any task performed by a faster model like Ada can be performed by a more powerful model like Curie or Davinci.
    case ada

    /// Code search: Find relevant code with a query in natural language.    code-search-{ada, babbage}-{code, text}-001    Code search and relevance
    case ada_code_search_code

    /// Code search: Find relevant code with a query in natural language.    code-search-{ada, babbage}-{code, text}-001    Code search and relevance
    case ada_code_search_text

    case ada_search_document

    case ada_search_query

    case ada_similarity

    /// Babbage can perform straightforward tasks like simple classification. It’s also quite capable when it comes to Semantic Search ranking how well documents match up with search queries. Good at: Moderate classification, semantic search classification
    case babbage

    case babbage_code_search_code

    case babbage_code_search_text

    case babbage_search_document

    case babbage_search_query

    case babbage_similarity

    case content_filter_alpha

    /// Almost as capable as Davinci Codex, but slightly faster. This speed advantage may make it preferable for real-time applications.
    case code_cushman_001

    /// Most capable Codex model. Particularly good at translating natural language to code. In addition to completing code, also supports inserting completions within code.
    case code_davinci_002

    case code_davinci_edit_001

    case code_search_ada_code_001

    case code_search_ada_text_001

    case code_search_babbage_code_001

    case code_search_babbage_text_001

    /// Curie is extremely powerful, yet very fast. While Davinci is stronger when it comes to analyzing complicated text, Curie is quite capable for many nuanced tasks like sentiment classification and summarization. Curie is also quite good at answering questions and performing Q&A and as a general service chatbot. Good at: Language translation, complex classification, text sentiment, summarization
    case curie

    case curie_instruct_beta

    case curie_search_document

    case curie_search_query

    case curie_similarity

    /// Davinci is the most capable engine and can perform any task the other models can perform and often with less instruction. For applications requiring a lot of understanding of the content, like summarization for a specific audience and creative content generation, Davinci is going to produce the best results. These increased capabilities require more compute resources, so Davinci costs more per API call and is not as fast as the other engines. Another area where Davinci shines is in understanding the intent of text. Davinci is quite good at solving many kinds of logic problems and explaining the motives of characters. Davinci has been able to solve some of the most challenging AI problems involving cause and effect.  Good at: Complex intent, cause and effect, summarization for audience
    case davinci

    case davinci_instruct_beta

    case davinci_search_document

    case davinci_search_query

    case davinci_similarity

    /// Capable of very simple tasks, usually the fastest model in the GPT-3 series, and lowest cost.
    case text_ada_001

    /// Capable of straightforward tasks, very fast, and lower cost.
    case text_babbage_001

    /// Very capable, but faster and lower cost than Davinci
    case text_curie_001

    case text_davinci_001

    /// Most capable GPT-3 model. Can do any task the other models can do, often with less context. In addition to responding to prompts, also supports inserting completions within text.
    case text_davinci_002

    case text_davinci_edit_001

    case text_davinci_insert_001

    case text_davinci_insert_002

    case text_search_ada_doc_001

    case text_search_ada_query_001

    case text_search_babbage_doc_001

    case text_search_babbage_query_001

    case text_search_curie_doc_001

    case text_search_curie_query_001

    case text_search_davinci_doc_001

    case text_search_davinci_query_001

    case text_similarity_ada_001

    case text_similarity_babbage_001

    case text_similarity_curie_001

    case text_similarity_davinci_001
}

public struct URLString: Equatable {
    var string: String
}

extension URLString: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        string = value.replacingOccurrences(of: "_", with: "-")
    }
}
