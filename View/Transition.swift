//
//  Transition.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class Transition<Input> {
    public var input: Input?
    public init() {}
    public func present(animated: Bool, callback: () -> () = { return }) {}
    public func dismiss(animated: Bool, callback: () -> () = { return }) {}
}
