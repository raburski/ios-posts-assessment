//
//  Builder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public class Builder<Input, Output> {
    public func buildWithInput(input: Input) throws -> Output {
        throw RuntimeError.MissingImplementation
    }
}

