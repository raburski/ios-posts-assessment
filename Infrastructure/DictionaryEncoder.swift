//
//  DictionaryEncoder.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class DictionaryEncoder<T> {
    public init() {}
    public func encodeObject(object: T) -> Dictionary<String, AnyObject>? {
        return nil
    }
    public func decodeDictionary(dict: Dictionary<String, AnyObject>) -> T? {
        return nil
    }
}
