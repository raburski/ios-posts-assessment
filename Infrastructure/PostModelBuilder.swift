//
//  PostModelBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import SwiftyJSON

class PostModelBuilder: ModelBuilder<PostModel> {
    override func build() throws -> PostModel {
        guard
            let input = self.input,
            let id = input["id"].int,
            let userId = input["userId"].int,
            let title = input["title"].string,
            let body = input["body"].string else {
            throw BuilderError.CouldNotParse
        }
        
        return PostModel(id: id, userId: userId, title: title, body: body)
    }
}
