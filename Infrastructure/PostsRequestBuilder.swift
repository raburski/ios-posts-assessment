//
//  PostsRequstBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

class PostsRequestBuilder: RequestBuilder<Any> {
    override func buildWithInput(input: Any?) throws -> NetworkRequest {
        let uuid = NSUUID().UUIDString
        // URL or domain could be injectable through init
        let request = NSURLRequest(URL: NSURL(string: "http://jsonplaceholder.typicode.com/posts")!)
        return NetworkRequest(uuid: uuid, request: request)
    }
}
