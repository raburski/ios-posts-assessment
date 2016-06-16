//
//  PostDetailsModel.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

public struct PostDetailsModel {
    public let post: PostModel
    public let userSource: Source<State<UserModel>>
    public let commentsSource: Source<State<[CommentModel]>>
    public let remove: Interactor<PostModel, PostModel>
    public init(post: PostModel, userSource: Source<State<UserModel>>, commentsSource: Source<State<[CommentModel]>>, remove: Interactor<PostModel, PostModel>) {
        self.post = post
        self.userSource = userSource
        self.commentsSource = commentsSource
        self.remove = remove
    }
}