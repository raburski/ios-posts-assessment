//
//  PostModel.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public struct PostModel {
    public let id: Int
    public let userId: Int
    public let title: String
    public let body: String
    public init(id: Int, userId: Int, title: String, body: String) {
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
}
