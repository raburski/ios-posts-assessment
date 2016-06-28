//
//  ApplicationTests.swift
//  ApplicationTests
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import XCTest
import XCTest_Gherkin
@testable import Application
@testable import Domain

class ApplicationTests: XCTestCase {
    override func setUp() {
        super.setUp()
        TestApplication.shared = TestApplication()
        TestApplication.shared.mainFlow.present(false)
    }

    func testExample() {
        
//        TestApplication.shared.listPresenter.selectFirstPost()
    
        Given("I have an example")
        When("When I test it")
        Then("The test succeeded")
    }
    
}
