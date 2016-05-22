//
//  ServicesProvider.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import Infrastructure

public class ServicesProvider {
    public static let sharedProvider = ServicesProvider()
    
    public var postsService: ModelsStore<[PostModel]>!
    public var commentsService: ModelsStore<[CommentModel]>!
    public var usersService: ModelsStore<[UserModel]>!
    
    init() {
        self.postsService = self.postsStore()
        self.commentsService = self.commentsStore()
        self.usersService = self.usersStore()
    }
    
    func postsStore() -> ModelsStore<[PostModel]> {
        let getPostsInteractor = NetworkRequestInteractorsFactory.sharedFactory.getPostsInteractor()
        let postEncoder = PostModelDictionaryEncoder()
        let postArrayEncoder = ArrayDictionaryEncoder<PostModel>(encoder: postEncoder)
        let storage = UserDefaultsStorage<[PostModel]>(key: "posts", defaults: NSUserDefaults.standardUserDefaults(), encoder: postArrayEncoder)
        return ModelsStore<[PostModel]>(fetchInteractor: getPostsInteractor, storage: storage)
    }
    
    func commentsStore() -> ModelsStore<[CommentModel]> {
        let getCommentsInteractor = NetworkRequestInteractorsFactory.sharedFactory.getCommentsInteractor()
        let storage = MemoryStorage<[CommentModel]>()
        return ModelsStore<[CommentModel]>(fetchInteractor: getCommentsInteractor, storage: storage)
    }
    
    func usersStore() -> ModelsStore<[UserModel]> {
        let getUsersInteractor = NetworkRequestInteractorsFactory.sharedFactory.getUsersInteractor()
        let storage = MemoryStorage<[UserModel]>()
        return ModelsStore<[UserModel]>(fetchInteractor: getUsersInteractor, storage: storage)
    }
}
