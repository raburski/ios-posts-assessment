//
//  UserDefaultsStorage.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class UserDefaultsStorage<T>: MemoryStorage<T> {
    let key: String
    let defaults: NSUserDefaults
    let encoder: DictionaryEncoder<T>
    public init(key: String, defaults: NSUserDefaults, encoder: DictionaryEncoder<T>) {
        self.key = key
        self.defaults = defaults
        self.encoder = encoder
        super.init()
    }
    public override func get() -> T? {
        if let object = super.get() {
            return object
        }
        
        if let data = self.defaults.objectForKey(self.key) as? Dictionary<String, AnyObject>,
           let object = self.encoder.decodeDictionary(data) as T? {
            try! super.insert(object) // TODO: Potentially unsafe
            return object
        }
        
        return nil
    }
    public override func insert(object: T) throws {
        try super.insert(object)
        self.defaults.setObject(self.encoder.encodeObject(object), forKey: self.key)
        self.defaults.synchronize()
    }
}
