//
//  PostsViewControllerTestCase.swift
//  Posts
//
//  Created by Marcin Raburski on 09.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import XCTest
import Application
import View
import Domain

class PostsViewControllerTestCase: ViewTests {
    let posts = [
        PostModel(id: 1, userId: 1, title: "Siemka1", body: "Siemanko"),
        PostModel(id: 2, userId: 1, title: "Siemka2", body: "Siemanko2")
    ]
    
    func setUpWithViewModel(viewModel: PostsListModel) {
        let view = PostsViewController(input: viewModel)
        super.setUpNavigationController(view)
    }

    func testRendersPosts() {
        let postsSource = Source(state: State.ready(data: self.posts))
        let viewModel = PostsListModel(posts: postsSource, select: Interactor<PostModel, Any>())
        self.setUpWithViewModel(viewModel)
        
        self.tester().waitForViewsWithAccessibilityLabels(posts.map({ (post: PostModel) -> String in
            return post.title
        }))
    }
    
    func testRendersLoading() {
        let postsSource = Source<State<[PostModel]>>(state: State.loading)
        let viewModel = PostsListModel(posts: postsSource, select: Interactor<PostModel, Any>())
        self.setUpWithViewModel(viewModel)
        
        self.tester().waitForViewWithAccessibilityLabel("Loading")
    }
    
    func testRendersError() {
        let postsSource = Source<State<[PostModel]>>(state: State.error(error: TestError.Error))
        let viewModel = PostsListModel(posts: postsSource, select: Interactor<PostModel, Any>())
        self.setUpWithViewModel(viewModel)
        
        self.tester().waitForViewWithAccessibilityLabel("Error")
    }
    
    func testInvokesShowDetail() {
        let showDetails: Interactor<PostModel, Any> = self.expectationInteractor()
        let postsSource = Source(state: State.ready(data: self.posts))
        let viewModel = PostsListModel(posts: postsSource, select: showDetails)
        self.setUpWithViewModel(viewModel)
        self.tester().tapViewWithAccessibilityLabel(self.posts.first!.title)
        
        if let input = showDetails.input, let post = self.posts.first {
            XCTAssertEqual(input, post)
        } else {
            XCTFail("PostModel missing in showDetails")
        }
        
        self.waitForExpectationsWithTimeout(10, handler: nil)
    }

}
