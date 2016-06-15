//
//  WindowTransition.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

public class WindowTransition: Transition<UIViewController> {
    let window: UIWindow
    public init(window: UIWindow) {
        self.window = window
    }
    public override func present(animated: Bool, callback: () -> ()) {
        window.rootViewController = self.input
        window.becomeKeyWindow()
    }
}
