//
//  TestPresenters.swift
//  Posts
//
//  Created by Marcin Raburski on 26.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Application

class TestPresenterFactory: PresenterFactory {
    let postsListPresenter: Presenter<PostsListModel>
    let postDetailPresenter: Presenter<PostDetailsModel>
    
    init() {
        self.postDetailPresenter = TestPresenter<PostDetailsModel>()
        self.postsListPresenter = PostsListTestPresenter()
    }
    
}
