//
//  MemoryStore.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

public class MemoryStorage<T>: Storage<T> {
    var stored: T? = nil
    public override init() {
        super.init()
    }
    public override func get() -> T? {
        return self.stored
    }
    public override func insert(object: T) throws {
        self.stored = object
    }
}
