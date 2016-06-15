//
//  Transition.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public class Transition<Input> {
    var input: Input?
    func present(animated: Bool, callback: () -> () = { return }) {}
    func dismiss(animated: Bool, callback: () -> () = { return }) {}
}
