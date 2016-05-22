//
//  PostModelDictionaryEncoder.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

public class PostModelDictionaryEncoder: DictionaryEncoder<PostModel> {
    public override init() {
        super.init()
    }
    public override func encodeObject(object: PostModel) -> Dictionary<String, AnyObject>? {
        return ["id":object.id, "userId":object.userId, "title":object.title, "body":object.body]
    }
    public override func decodeDictionary(dict: Dictionary<String, AnyObject>) -> PostModel? {
        guard
            let id = dict["id"] as? Int,
            let userId = dict["userId"] as? Int,
            let title = dict["title"] as? String,
            let body = dict["body"] as? String
            else {
                return nil
        }
        return PostModel(id: id, userId: userId, title: title, body: body)
    }
}
