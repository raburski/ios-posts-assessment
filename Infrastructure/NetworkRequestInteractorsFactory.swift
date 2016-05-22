//
//  NetworkRequestInteractorsFactory.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import Domain

public class NetworkRequestInteractorsFactory {
    public static let sharedFactory = NetworkRequestInteractorsFactory()
    
    let networkRequestDispatcher = NetworkingService.sharedService
    
    public func getPostsInteractor() -> Interactor<Any, [PostModel]> {
        let requestBuilder = PostsRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: PostModelBuilder())
        return NetworkRequestWithNoInputInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }
    
    public func getUsersInteractor() -> Interactor<Any, [UserModel]> {
        let requestBuilder = UsersRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: UserModelBuilder())
        return NetworkRequestWithNoInputInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }

    public func getCommentsInteractor() -> Interactor<Any, [CommentModel]> {
        let requestBuilder = CommentsRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: CommentModelBuilder())
        return NetworkRequestWithNoInputInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }
    
}
