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

public class SourceFactory {
    public static let sharedFactory = SourceFactory()
    
    var servicesProvider: ServicesProvider {
        return ServicesProvider.sharedProvider
    }
    
    public func postsSource() -> StateSource<[PostModel]> {
        return self.servicesProvider.postsService
    }
    
    public func usersSource() -> StateSource<[UserModel]> {
        return self.servicesProvider.usersService
    }
    
    public func commentsSource() -> StateSource<[CommentModel]> {
        return self.servicesProvider.commentsService
    }
    
    public func userWithPostQueryable() -> QueryableSource<PostModel?, State<UserModel>> {
        let postSource = Source<PostModel?>()
        let userSource = UserWithPostSource(postSource: postSource, usersSource: SourceFactory.sharedFactory.usersSource())
        return QueryableSource(inputSource: postSource, outputSource: userSource)
    }
    
    public func commentsWithPostQueryable() -> QueryableSource<PostModel?, State<[CommentModel]>> {
        let postSource = Source<PostModel?>()
        let commentsSource = CommentsWithPostSource(postSource: postSource, commentsSource: SourceFactory.sharedFactory.commentsSource())
        return QueryableSource(inputSource: postSource, outputSource: commentsSource)
    }
}
