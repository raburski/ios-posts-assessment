//
//  PostsListTestPresenter.swift
//  Posts
//
//  Created by Marcin Raburski on 23.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Application
import Domain

class PostsListTestPresenter: TestPresenter<PostsListModel> {
    override func present(animated: Bool, callback: () -> ()) {
        print(self.input!.posts.state)
        super.present(animated, callback: callback)
    }
    
    func selectFirstPost() {
        switch self.input!.posts.state {
        case .ready(let posts):
            self.input?.select.input = posts.first
            self.input?.select.execute()
        default:
            print("Not ready")
        }
    }
}
