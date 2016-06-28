//
//  PresenterFactory.swift
//  Posts
//
//  Created by Marcin Raburski on 26.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation

public protocol PresenterFactory {
    var postsListPresenter: Presenter<PostsListModel> { get }
    var postDetailPresenter: Presenter<PostDetailsModel> { get }
}
