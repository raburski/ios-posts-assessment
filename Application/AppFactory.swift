//
//  AppFactory.swift
//  Posts
//
//  Created by Marcin Raburski on 26.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class AppFactory {
    let presenter: PresenterFactory
    
    public init(presenterFactory: PresenterFactory) {
        self.presenter = presenterFactory
    }
    
    public func mainFlow() -> Flow<Any, Any> {
        let detailFlow = PostDetailsFlow(presenter: self.presenter.postDetailPresenter, userSource: SourceFactory.sharedFactory.userWithPostQueryable(), commentsSource: SourceFactory.sharedFactory.commentsWithPostQueryable())
        
        return PostsFlow(postsSource: SourceFactory.sharedFactory.postsSource(), detailsFlow: detailFlow, presenter: self.presenter.postsListPresenter)
    }
}
