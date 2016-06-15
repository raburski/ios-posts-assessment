//
//  PostsViewModel.swift
//  Posts
//
//  Created by Marcin Raburski on 03.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain

public struct PostsListModel {
    public let posts: Source<State<[PostModel]>>
    public let select: Interactor<PostModel, Any>
    public init(posts: Source<State<[PostModel]>>, select: Interactor<PostModel, Any>) {
        self.posts = posts
        self.select = select
    }
}