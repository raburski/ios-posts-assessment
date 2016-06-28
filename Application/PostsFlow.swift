//
//  PostsFlow.swift
//  Posts
//
//  Created by Marcin Raburski on 03.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

public class PostsFlow: Flow<Any, Any> {
    let presenter: Presenter<PostsListModel>
    
    public init(postsSource: StateSource<[PostModel]>, detailsFlow: Flow<PostModel, Any>, presenter: Presenter<PostsListModel>) {
        self.presenter = presenter
        self.presenter.input = PostsListModel(posts: postsSource, select: detailsFlow)
    }
    
    public override func present(animated: Bool = true, callback: (data: Any?, error: ErrorType?) -> () = { (data, error) in return }) {
        self.presenter.present(animated)
    }
    
    public override func dismiss(animated: Bool, callback: () -> () = { return } ) {
        self.presenter.dismiss(animated, callback: callback)
    }
}
