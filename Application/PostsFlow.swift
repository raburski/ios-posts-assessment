//
//  PostsFlow.swift
//  Posts
//
//  Created by Marcin Raburski on 03.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain

public class PostsListFlow: Flow<Any, Any> {
    let postsSource: StateSource<[PostModel]>
    let detailsFlow: Flow<PostModel, Any>
    
    var postsViewModel: PostsViewModel {
        return PostsViewModel(posts: self.postsSource, showDetail: self.detailsFlow)
    }
    
    public init(postsSource: StateSource<[PostModel]>, detailsFlow: Flow<PostModel, Any>) {
        self.postsSource = postsSource
        self.detailsFlow = detailsFlow
    }
    
    public override func present(animated: Bool, callback: (data: Any?, error: ErrorType?) -> ()) {
        
    }
    
    
}
