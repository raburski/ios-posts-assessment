//
//  PostDetailsViewModel.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Application

public struct PostDetailsViewModel {
    public let title: String
    public let body: String
    public let username: String?
    public let commentsCount: Int?
    public init(title: String, body: String, username: String?, commentsCount: Int?) {
        self.title = title
        self.body = body
        self.username = username
        self.commentsCount = commentsCount
    }
    
//    convenience init(model: PostDetailsModel) {
//        self.init(title: model.post.title, body: model.post.body, username: model.user.username, commentsCount: )
//    }
}