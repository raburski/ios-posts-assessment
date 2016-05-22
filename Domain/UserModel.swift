//
//  UserModel.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public struct UserModel {
    public let id: Int
    public let username: String
    public init(id: Int, username: String) {
        self.id = id
        self.username = username
    }
}
