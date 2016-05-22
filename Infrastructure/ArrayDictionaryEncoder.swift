//
//  ArrayDictionaryEncoder.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class ArrayDictionaryEncoder<T>: DictionaryEncoder<Array<T>> {
    let encoder: DictionaryEncoder<T>
    public init(encoder: DictionaryEncoder<T>) {
        self.encoder = encoder
    }
    public override func encodeObject(object: Array<T>) -> Dictionary<String, AnyObject>? {
        return ["array": object.map({ (element: T) -> Dictionary<String, AnyObject> in
            return encoder.encodeObject(element)!
        })]
    }
    public override func decodeDictionary(dict: Dictionary<String, AnyObject>) -> Array<T>? {
        guard let array = dict["array"] as? Array<Dictionary<String, AnyObject>> else {
            return nil
        }
        
        return array.map({ (element: Dictionary<String, AnyObject>) -> T in
            let object = self.encoder.decodeDictionary(element)
            return object!
        })
    }
}
