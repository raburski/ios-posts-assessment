//
//  NavigationViewBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Application

public class NavigationViewBuilder: ViewBuilder<Any, UINavigationController> {
    public override init() { super.init() }
    public override func build() throws -> UINavigationController {
        return UINavigationController()
    }
}
