//
//  CommentsWithPostSource.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//


public class CommentsWithPostSource: Source<State<[CommentModel]>> {
    let postSource: Source<PostModel?>
    let commentsSource: Source<State<[CommentModel]>>
    public init(postSource: Source<PostModel?>, commentsSource: Source<State<[CommentModel]>>) {
        self.postSource = postSource
        self.commentsSource = commentsSource
        super.init()
        self.subscribeSelf(self.commentsSource)
        self.subscribeSelf(self.postSource)
    }
    
    override public func getState() -> State<[CommentModel]> {
        guard let post = self.postSource.state else {
            return .loading
        }
        
        switch self.commentsSource.state {
        case .loading: return .loading
        case .error(let error): return .error(error: error)
        case .ready(let comments): return .ready(data: self.commentsFilteredWithPost(comments, post: post))
        }
    }
    
    func commentsFilteredWithPost(comments:[CommentModel], post: PostModel) -> [CommentModel] {
        return comments.filter({ (element: CommentModel) -> Bool in
            return (element.postId == post.id)
        })
    }
}
