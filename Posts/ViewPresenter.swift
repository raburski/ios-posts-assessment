//
//  ViewPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Application
import UIKit

public class ViewPresenter<Input>: Presenter<Input> {
    let builder: ViewBuilder<Input, UIViewController>
    let transition: Transition<UIViewController>
    public init(builder: ViewBuilder<Input, UIViewController>, transition: Transition<UIViewController>) {
        self.builder = builder
        self.transition = transition
    }
    
    override public func present(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        self.builder.input = self.input
        do {
            self.transition.input = try self.builder.build()
            self.transition.present(animated)
        } catch {
            print("WARNING: Failed to present View: %@", error)
        }
    }
}
