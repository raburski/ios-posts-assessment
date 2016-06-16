//
//  PostDetailsSource.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

class PostDetailsViewModelSource: Source<State<PostDetailsViewModel>> {
    let post: PostModel
    let userSource: Source<State<UserModel>>
    let commentsSource: Source<State<[CommentModel]>>
    init(post: PostModel, userSource: Source<State<UserModel>>, commentsSource: Source<State<[CommentModel]>>) {
        self.post = post
        self.userSource = userSource
        self.commentsSource = commentsSource
        super.init()
        self.subscribeSelf(self.userSource)
        self.subscribeSelf(self.commentsSource)
    }
    
    override func getState() -> State<PostDetailsViewModel> {
        let title = self.post.title
        let body = self.post.body
        var username: String? = nil
        var commentsCount: Int? = nil
        
        switch self.userSource.state {
        case .error(let error): return .error(error: error)
        case .loading: break
        case .ready(let user): username = user.username
        }
        
        switch self.commentsSource.state {
        case .error(let error): return .error(error: error)
        case .loading: break
        case .ready(let comments): commentsCount = comments.count
        }
        
        return .ready(data: PostDetailsViewModel(title: title, body: body, username: username, commentsCount: commentsCount))
    }
}
