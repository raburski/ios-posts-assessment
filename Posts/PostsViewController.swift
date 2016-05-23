//
//  PostsViewController.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Application
import Domain

class PostsViewController: UITableViewController {
    let postsSource = SourceFactory.sharedFactory.postsSource()
    let tableViewDataSource = PostsTableViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.tableViewDataSource
        self.postsSource.subscribeAndInvoke(self, selector: "reloadData")
    }
    
    func reloadData() {
        self.renderLoading(false)
        
        switch self.postsSource.state {
        case .loading: self.renderLoading(true)
        case .error(let error): self.renderError(error)
        case .ready(let data): self.renderPosts(data)
        }
    }
    
    // MARK: Rendering
    
    func renderLoading(loading: Bool) {
        self.tableView.setAndLayoutTableHeaderView(loading ? LoadingView() : nil)
    }
    
    func renderError(error: ErrorType) {
        let errorView = ErrorView()
        errorView.setError(error)
        self.tableView.setAndLayoutTableHeaderView(errorView)
    }
    
    func renderPosts(posts: [PostModel]) {
        self.tableViewDataSource.posts = posts
        self.tableView.reloadData()
    }
    
    // MARK: TableView Delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // This behaviour should be injected via FlowController/Interactor
        let post = self.tableViewDataSource.postForIndexPath(indexPath)
        let detailsViewController = PostDetailsViewController()
        detailsViewController.source = SourceFactory.sharedFactory.postDetailsSourceWithPost(post)
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
