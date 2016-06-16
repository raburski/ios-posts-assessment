//
//  ViewPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Application
import Domain
import UIKit

public class ViewPresenter<Input>: Presenter<Input> {
    public let viewSource: Source<UIViewController?> = Source()
    
    let builder: ViewBuilder<Input, UIViewController>
    let transition: Transition<UIViewController>
    public init(builder: ViewBuilder<Input, UIViewController>, transition: Transition<UIViewController>) {
        self.builder = builder
        self.transition = transition
    }
    
    override public func present(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        self.builder.input = self.input
        do {
            let viewController = try self.builder.build()
            self.transition.input = viewController
            self.transition.present(animated)
            self.viewSource.setState(viewController)
        } catch {
            print("WARNING: Failed to present View: %@", error)
        }
    }
}
