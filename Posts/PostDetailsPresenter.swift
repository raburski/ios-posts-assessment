//
//  PostDetailsPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import UIKit
import Domain
import Application

public class PostDetailsPresenter: Presenter<Source<State<PostDetailsModel>>> {
    let base: Source<UINavigationController?>
    public init(base: Source<UINavigationController?>) {
        self.base = base
        super.init()
    }
    
    public override func present(animated: Bool, callback: () -> ()) {
        guard let input = self.input, let base = self.base.state else {
            return
        }
        
        let viewController = PostDetailsViewController()
//        viewController.source = input
        base.pushViewController(viewController, animated: animated)
    }
}
