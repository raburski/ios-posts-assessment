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

extension PostsListModel {
    var title: String {
        switch self.posts.state {
        case .loading: return "Loading Posts..."
        case .error: return "Error!"
        case .ready(let posts): return "Posts (\(posts.count))"
        }
    }
}

public class PostsViewController: TableViewController<PostsListModel> {
    let tableViewDataSource = PostsTableViewDataSource()
    
    override public init(input: PostsListModel, nibName: String? = nil, bundle: NSBundle? = nil) {
        super.init(input: input, nibName: nibName, bundle: bundle)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.tableViewDataSource
        self.input.posts.subscribeAndInvoke(self, selector: #selector(reloadData))
        
    }
    
    func reloadData() {
        self.title = self.input.title
        self.renderLoading(false)
        
        switch self.input.posts.state {
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
    
    override public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.input.select.input = self.tableViewDataSource.postForIndexPath(indexPath)
        self.input.select.execute()
//        let post = self.tableViewDataSource.postForIndexPath(indexPath)
//        let detailsViewController = PostDetailsViewController()
//        detailsViewController.source = SourceFactory.sharedFactory.postDetailsSourceWithPost(post)
//        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
}
