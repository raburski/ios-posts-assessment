//
//  InteractorProtocol.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

public enum InteractorError : ErrorType {
    case InputDataMissing
}

public class Interactor<Input, Output> {
    public var input: Input?
    public var isLoading: Bool {
        return self.getIsLoading()
    }
    
    public init() {}
    
    public func execute(callback: (data: Output?, error: ErrorType?) -> ()) {
        callback(data: nil, error: RuntimeError.MissingImplementation)
    }
    
    public func getIsLoading() -> Bool {
        return false
    }
}
