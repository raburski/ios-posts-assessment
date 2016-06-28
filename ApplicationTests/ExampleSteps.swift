//
//  ExampleSteps.swift
//  Posts
//
//  Created by Marcin Raburski on 23.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class ExampleSteps: StepDefiner {
    override func defineSteps() {
        step("I have an example") {
            self.test
        }
        step("When I test it") {
            
        }
        step("The test succeeded") {XCTAssertTrue(true)}
    }
}
