//
//  NetworkRequestInteractorsFactory.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import Domain

class NetworkRequestInteractorsFactory {
    static let sharedFactory = NetworkRequestInteractorsFactory()
    
    let networkRequestDispatcher = NetworkingService.sharedService
    
    func getPostsInteractor() -> NetworkRequestInteractor<Any?, [PostModel]> {
        let requestBuilder = PostsRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: PostModelBuilder())
        return NetworkRequestInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }
    
    func getUsersInteractor() -> NetworkRequestInteractor<Any?, [UserModel]> {
        let requestBuilder = UsersRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: UserModelBuilder())
        return NetworkRequestInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }

    func getCommentsInteractor() -> NetworkRequestInteractor<Any?, [CommentModel]> {
        let requestBuilder = CommentsRequestBuilder()
        let modelBuilder = ArrayModelBuilder(modelBuilder: CommentModelBuilder())
        return NetworkRequestInteractor(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: self.networkRequestDispatcher)
    }
    
}
