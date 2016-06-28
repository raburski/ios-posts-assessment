//
//  PresentersFactory.swift
//  Posts
//
//  Created by Marcin Raburski on 18.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Domain
import Application

public class PresentersFactory: PresenterFactory {
    public let postDetailPresenter: Presenter<PostDetailsModel>
    public let postsListPresenter: Presenter<PostsListModel>
    
    
    public init(window: UIWindow) {
        let navigationPresenter = ViewPresenter(
            builder: NavigationViewBuilder(),
            transition: WindowTransition(window: window)
        )
        
        let pushTransition = PushTransition(viewControllerSource: navigationPresenter.viewSource)
        
        let listTransition = ViewPresenterTransition<UIViewController>(presenter: navigationPresenter, transition: pushTransition)
        
        self.postsListPresenter = ViewPresenter(
            builder: PostsViewBuilder(),
            transition: listTransition
        )
        
        self.postDetailPresenter = ViewPresenter(
            builder: PostDetailsViewBuilder(),
            transition: pushTransition
        )
    }
}
