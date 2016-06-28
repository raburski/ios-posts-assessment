//
//  ViewPresenterTransition.swift
//  Posts
//
//  Created by Marcin Raburski on 16.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Application

public class ViewPresenterTransition<View>: Transition<View> {
    let presenter: Presenter<Any>
    let transition: Transition<View>
    public init(presenter: Presenter<Any>, transition: Transition<View>) {
        self.presenter = presenter
        self.transition = transition
    }
    
    public override func present(animated: Bool, callback: () -> ()) {
        self.presenter.present(animated) {
            self.transition.input = self.input
            self.transition.present(animated, callback: callback)
        }
    }
}
