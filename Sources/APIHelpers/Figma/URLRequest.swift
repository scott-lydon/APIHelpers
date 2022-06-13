//
//  URLRequest.swift
//  APIs
//
//  Created by Scott Lydon on 6/12/22.
//

import Foundation

public enum BoardID: String {
    case singleElement = "qIW0ipGzSVr7zOfPwgrmhZ"
    case qrCodeTarot = "Z7AdVQgzyWeMZMjyBz8gR6"
}

public extension URLRequest {

    /// Creates a URLRequest that can call upon the JSON of a Figma board.  Original interest in this was for the open ai endpoint so that this can be provided to train it to automatically create reusable programmatic views.  Perhaps I can open up a new board with the view that I want to have copied over...Then I can get just the JSON that is relevant.
    /// - Parameters:
    ///   - board: You can get your board id by opening up the Figma Desktop app, clicking the share button, copy the link, the board will be included in the link.  For example: `https://www.figma.com/file/qIW0ipGzSVr7zOfPwgrmhZ/Untitled?node-id=2%3A12` the board id is: `qIW0ipGzSVr7zOfPwgrmhZ`.
    ///   - personalAccessToken: You can get the personal access token by generating it.  Open Figma website, sign in, then click on settings, scroll down to the personal access tokens section.  Add a token description, and then click enter.
    /// - Returns: Returns a working URLRequest to get the figma board as JSON.
    static func figma(
        board: String,
        personalAccessToken: String
    ) -> URLRequest {
        var request = URLRequest(url: String.figma(board: board).url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["X-Figma-Token": personalAccessToken]
        return request
    }

    static func figma(
        boardID: BoardID,
        personalAccessToken: String
    ) -> URLRequest {
        .figma(board: boardID.rawValue, personalAccessToken: personalAccessToken)
    }
}
