//
//  ExpectationInteractor.swift
//  Posts
//
//  Created by Marcin Raburski on 11.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Domain
import XCTest

class ExpectationInteractor<Input, Output>: Interactor<Input, Output> {
    let expectation: XCTestExpectation
    init(expectation: XCTestExpectation) {
        self.expectation = expectation
    }
    
    override func execute(callback: (data: Output?, error: ErrorType?) -> ()) {
        self.expectation.fulfill()
    }
}
