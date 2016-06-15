//
//  PresentTransition.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import UIKit

public class PresentTransition: Transition<UIViewController> {
    let viewControllerSource: Source<UINavigationController?>
    public init(viewControllerSource: Source<UINavigationController?>) {
        self.viewControllerSource = viewControllerSource
    }
    public override func present(animated: Bool, callback: () -> ()) {
        guard let viewControllerBase = self.viewControllerSource.state, viewController = self.input else {
            return
        }
        
        viewControllerBase.presentViewController(viewController, animated: animated, completion: callback)
    }
}
