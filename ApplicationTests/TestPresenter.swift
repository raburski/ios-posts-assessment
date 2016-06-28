//
//  TestPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 23.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Application

class TestPresenter<Input>: Presenter<Input> {
    var presented = false
    var dismissed = false
    override init() {
        super.init()
    }
    
    internal override func present(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        self.presented = true
        print("Presented with input: %@", self.input.dynamicType)
        callback()
    }
    internal override func dismiss(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        self.dismissed = true
        print("Dismissed with input: %@", self.input.dynamicType)
        callback()
    }
}
