//
//  ViewTests.swift
//  ViewTests
//
//  Created by Marcin Raburski on 09.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import XCTest
import UIKit
import View
import KIF

enum TestError: ErrorType {
    case Error
}

class ViewTests: XCTestCase {
    func setUpNavigationController(rootViewController: UIViewController) {
        UIApplication.sharedApplication().keyWindow?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
    
    func setUpViewController(rootViewController: UIViewController) {
        UIApplication.sharedApplication().keyWindow?.rootViewController = rootViewController
    }
    
    func wait() {
        self.expectationForNotification("totally_random_name", object: nil, handler: nil)
        self.waitForExpectationsWithTimeout(1000000, handler: nil)
    }
}
