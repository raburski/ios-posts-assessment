//
//  NetworkRequestWithNoInputInteractor.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

class NetworkRequestWithNoInputInteractor<Output>: NetworkRequestInteractor<Any, Output> {
    override init(requestBuilder: RequestBuilder<Any>, modelBuilder: ModelBuilder<Output>, dispatcher: NetworkRequestDispatcher) {
        super.init(requestBuilder: requestBuilder, modelBuilder: modelBuilder, dispatcher: dispatcher)
    }
    override func execute(callback: (data: Output?, error: ErrorType?) -> ()) {
        self.input = "" // I am not too proud of this one tho
        super.execute(callback)
    }
}
