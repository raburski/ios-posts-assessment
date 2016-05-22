//
//  PostDetailsModel.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public struct PostDetailsModel {
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
}