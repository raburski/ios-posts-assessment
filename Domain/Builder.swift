//
//  Builder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public enum BuilderError: ErrorType {
    case CouldNotParse
}

public class Builder<Input, Output> {
    public var input: Input?
    public init() {}
    public func build() throws -> Output {
        throw RuntimeError.MissingImplementation
    }
}

