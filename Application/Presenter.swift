//
//  Presenter.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class Presenter<Input> {
    public var input: Input?
    public func present(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        
    }
    public func dismiss(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        
    }
}
