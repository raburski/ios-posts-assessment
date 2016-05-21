//
//  CommentModel.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public struct CommentModel {
    let id: Int
    let postId: Int
    public init(id: Int, postId: Int) {
        self.id = id
        self.postId = postId
    }
}
