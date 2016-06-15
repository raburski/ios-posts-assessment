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
    public let user: UserModel
    public let comments: [CommentModel]
    public init(post: PostModel, user: UserModel, comments: [CommentModel]) {
        self.post = post
        self.user = user
        self.comments = comments
    }
}