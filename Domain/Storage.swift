//
//  Storage.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public class Storage<T> {
    public init() {}
    public func get() -> T? {
        return nil
    }
    public func insert(object: T) throws {
        throw RuntimeError.MissingImplementation
    }
}
