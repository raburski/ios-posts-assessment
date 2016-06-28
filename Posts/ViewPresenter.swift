//
//  ViewPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import UIKit

public class ViewPresenter<Input, View>: Presenter<Input> {
    public let viewSource: Source<View?> = Source()
    
    let builder: ViewBuilder<Input, View>
    let transition: Transition<View>
    public init(builder: ViewBuilder<Input, View>, transition: Transition<View>) {
        self.builder = builder
        self.transition = transition
    }
    
    override public func present(animated: Bool = true, callback: () -> () = { () -> () in return }) {
        self.builder.input = self.input
        do {
            let viewController = try self.builder.build()
            self.viewSource.setState(viewController)
            self.transition.input = viewController
            self.transition.present(animated)
            callback()
        } catch {
            print("WARNING: Failed to present View: %@", error)
        }
    }
}
