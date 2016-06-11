//
//  DataSourceFactory.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import Application
import Infrastructure
import View

public class SourceFactory {
    public static let sharedFactory = SourceFactory()
    
    var servicesProvider: ServicesProvider {
        return ServicesProvider.sharedProvider
    }
    
    public func postsSource() -> StateSource<[PostModel]> {
        return self.servicesProvider.postsService
    }
    
//    public func postDetailsSourceWithPost(post: PostModel) -> Source<PostDetailsModel> {
//        let userSource = UserWithPostSource(post: post, usersSource: self.servicesProvider.usersService)
//        let commentsSource = CommentsWithPostSource(post: post, commentsSource: self.servicesProvider.commentsService)
//        return PostDetailsSource(post: post, userSource: userSource, commentsSource: commentsSource)
//    }

}
