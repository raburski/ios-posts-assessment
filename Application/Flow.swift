//
//  Flow.swift
//  Posts
//
//  Created by Marcin Raburski on 31.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain

public class Flow<Input, Output>: Interactor<Input, Output> {
    override public func execute(callback: (data: Output?, error: ErrorType?) -> ()) {
        self.present(callback: callback)
    }

    public func present(animated: Bool = true, callback: (data: Output?, error: ErrorType?) -> ()) {
        
    }
    public func dismiss(animated: Bool = true, callback: (data: Output?, error: ErrorType?) -> ()) {
        
    }
}