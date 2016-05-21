//
//  NetworkRequestInteractor.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import Domain

class NetworkRequestInteractor<Input, Output>: Interactor<Input, Output> {
    let requestBuilder: RequestBuilder<Input>
    let modelBuilder: ModelBuilder<Output>
    let dispatcher: NetworkRequestDispatcher
    var request: NetworkRequest?
    
    init(requestBuilder: RequestBuilder<Input>, modelBuilder: ModelBuilder<Output>, dispatcher: NetworkRequestDispatcher) {
        self.requestBuilder = requestBuilder
        self.modelBuilder = modelBuilder
        self.dispatcher = dispatcher
        super.init()
    }
    
    override func getIsLoading() -> Bool {
        return self.request != nil
    }
    
    override func execute(callback: (data: Output?, error: ErrorType?) -> ()) {
        guard let input = self.input else {
            callback(data: nil, error: InteractorError.InputDataMissing)
            return
        }
        
        do {
            let request = try self.requestBuilder.buildWithInput(input)
            self.request = request
            self.dispatchRequest(request, callback: callback)
        } catch let error {
            callback(data: nil, error: error)
            return
        }
    }
    
    func dispatchRequest(request: NetworkRequest, callback: (data: Output?, error: ErrorType?) -> ()) {
        self.dispatcher.executeRequest(request) { (request, json, error) -> () in
            self.request = nil
            do {
                if let json = json {
                    let model = try self.modelBuilder.buildWithInput(json)
                    callback(data: model, error: error)
                } else {
                    callback(data: nil, error: error)
                }
            } catch let buildError {
                callback(data: nil, error: buildError)
            }
        }
    }
}
