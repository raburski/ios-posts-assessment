//
//  PostsViewController.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Infrastructure
import Domain

class PostsViewController: UITableViewController {
    let postsSource: Source<[PostModel]> = []
    let tableViewDataSource = PostsTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.tableViewDataSource
        self.postsSource.subscribeAndInvoke(self, selector: "reloadData")
    }
    
    func reloadData() {
        switch self.postsSource.state {
        case .loading: self.renderLoading(true)
        case .error(let error): self.renderError(error)
        case .ready(let data): self.renderPosts(data)
        }
    }
    
    // MARK: Rendering
    
    func renderLoading(loading: Bool) {
        self.tableView.tableHeaderView = loading ? LoadingView() : nil
    }
    
    func renderError(error: ErrorType) {
        let errorView = ErrorView()
        errorView.setError(error)
        self.tableView.tableHeaderView = errorView
    }
    
    func renderPosts(posts: [PostModel]) {
        self.tableViewDataSource.posts = posts
        self.tableView.reloadData()
    }
    
}
