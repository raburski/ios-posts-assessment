//
//  DataSourceFactory.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import Infrastructure

public class SourceFactory {
    public static let sharedFactory = SourceFactory()
    
    public func postsStore() -> Source<[PostModel]> {
        let getPostsInteractor = NetworkRequestInteractorsFactory.sharedFactory.getPostsInteractor()
        let postEncoder = PostModelDictionaryEncoder()
        let postArrayEncoder = ArrayDictionaryEncoder<PostModel>(encoder: postEncoder)
        let storage = UserDefaultsStorage<[PostModel]>(key: "posts", defaults: NSUserDefaults.standardUserDefaults(), encoder: postArrayEncoder)
        return ModelsStore<[PostModel]>(fetchInteractor: getPostsInteractor, storage: storage)
    }
}
