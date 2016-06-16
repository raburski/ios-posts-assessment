//
//  PostDetailsViewBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import Application
import UIKit

public class PostDetailsViewBuilder: ViewBuilder<PostDetailsModel, UIViewController> {
    public override init() { super.init() }
    public override func build() throws -> UIViewController {
        guard let input = self.input else {
            throw BuilderError.InputMissing
        }
        let viewController = PostDetailsViewController()
        viewController.source = PostDetailsViewModelSource(post: input.post, userSource: input.userSource, commentsSource: input.commentsSource)
        return viewController
    }
}