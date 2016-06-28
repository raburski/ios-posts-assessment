//
//  Application.swift
//  Posts
//
//  Created by Marcin Raburski on 26.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import Application

class TestApplication {
    static var shared: TestApplication!
    
    let presenters = TestPresenterFactory()
    var mainFlow: Flow<Any, Any>!
    
    init() {
        let appFactory = AppFactory(presenterFactory: self.presenters)
        self.mainFlow = appFactory.mainFlow()
    }
    
}
