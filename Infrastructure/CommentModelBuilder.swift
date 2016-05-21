//
//  CommentModelBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import SwiftyJSON

class CommentModelBuilder: ModelBuilder<CommentModel> {
    override func buildWithInput(input: JSON) throws -> CommentModel {
        guard let id = input["id"].int, let postId = input["postId"].int else {
            throw BuilderError.CouldNotParse
        }
        
        return CommentModel(id: id, postId: postId)
    }
}
