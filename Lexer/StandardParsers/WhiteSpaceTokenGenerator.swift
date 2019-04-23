//
//  WhiteSpaceTokenGenerator.swift
//  Ogma
//
//  Created by Mathias Quintero on 4/23/19.
//

import Foundation

extension TokenProtocol {

    // TODO: Find a better API for this
    public static var supportWhiteSpaces: AnyTokenGenerator<Self> {
        return WhiteSpaceTokenGenerator().any()
    }

}

public struct WhiteSpaceTokenGenerator<Token: TokenProtocol>: RegexTokenGenerator {
    public let pattern: String = "[ \t\n]+"

    public func token(from matched: String) throws -> Token? {
        return nil
    }
}
