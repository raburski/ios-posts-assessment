//
//  NavigationViewBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

public class NavigationViewBuilder: ViewBuilder<Any, UINavigationController> {
    override public init() {
        super.init()
    }
    public override func build() throws -> UINavigationController {
        return UINavigationController()
    }
}
