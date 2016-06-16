//
//  PostsViewBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 15.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import Application
import UIKit

public class PostsViewBuilder: ViewBuilder<PostsListModel, UIViewController> {
    public override init() { super.init() }
    public override func build() throws -> UIViewController {
        guard let input = self.input else {
            throw BuilderError.InputMissing
        }
        return PostsViewController(input: input)
    }
}
