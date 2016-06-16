//
//  PostDetailsFlow.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain

public class PostDetailsFlow: Flow<PostModel, Any> {
    let presenter: Presenter<PostDetailsModel>
    let userSource: QueryableSource<PostModel?, State<UserModel>>
    let commentsSource: QueryableSource<PostModel?, State<[CommentModel]>>
    
    public init(presenter: Presenter<PostDetailsModel>, userSource: QueryableSource<PostModel?, State<UserModel>>, commentsSource: QueryableSource<PostModel?, State<[CommentModel]>>) {
        self.presenter = presenter
        self.userSource = userSource
        self.commentsSource = commentsSource
        super.init()
    }
    public override func present(animated: Bool = true, callback: (data: Any?, error: ErrorType?) -> () = { (data, error) in return }) {
        guard let post = self.input else {
            return
        }
        
        self.userSource.query = post
        self.commentsSource.query = post
        
        self.presenter.input = PostDetailsModel(post: post, userSource: self.userSource, commentsSource: self.commentsSource, remove: Interactor<PostModel, PostModel>())
        self.presenter.present(animated)
    }
}
