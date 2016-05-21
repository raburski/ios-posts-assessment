//
//  UserModel.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public struct UserModel {
    let id: Int
    let username: String
    public init(id: Int, username: String) {
        self.id = id
        self.username = username
    }
}
