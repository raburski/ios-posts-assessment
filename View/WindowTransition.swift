//
//  WindowTransition.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Application

public class WindowTransition: Transition<UINavigationController> {
    let window: UIWindow
    public init(window: UIWindow) {
        self.window = window
        super.init()
    }
    public override func present(animated: Bool, callback: () -> ()) {
        window.rootViewController = self.input
        window.becomeKeyWindow()
        callback()
    }
}
