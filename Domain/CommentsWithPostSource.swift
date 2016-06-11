//
//  CommentsWithPostSource.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//


public class CommentsWithPostSource: StateSource<[CommentModel]> {
    let post: PostModel
    let commentsSource: StateSource<[CommentModel]>
    public init(post: PostModel, commentsSource: StateSource<[CommentModel]>) {
        self.post = post
        self.commentsSource = commentsSource
        super.init()
        self.subscribeSelf(self.commentsSource)
    }
    
    override public func getState() -> State<[CommentModel]> {
        switch self.commentsSource.state {
        case .loading: return .loading
        case .error(let error): return .error(error: error)
        case .ready(let comments): return .ready(data: self.commentsFilteredWithPost(comments, post: self.post))
        }
    }
    
    func commentsFilteredWithPost(comments:[CommentModel], post: PostModel) -> [CommentModel] {
        return comments.filter({ (element: CommentModel) -> Bool in
            return (element.postId == post.id)
        })
    }
}
