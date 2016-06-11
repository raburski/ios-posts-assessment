//
//  PostsViewModel.swift
//  Posts
//
//  Created by Marcin Raburski on 03.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain

public struct PostsViewModel {
    public let posts: Source<State<[PostModel]>>
    public let showDetail: Interactor<PostModel, Any>
    public init(posts: Source<State<[PostModel]>>, showDetail: Interactor<PostModel, Any>) {
        self.posts = posts
        self.showDetail = showDetail
    }
}