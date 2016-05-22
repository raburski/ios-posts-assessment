//
//  PostDetailsViewController.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import Application
import Domain

class PostDetailsViewController: UIViewController {
    var source: Source<PostDetailsModel>!
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var bodyTextView: UITextView!
    @IBOutlet var commentsCountLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.source.subscribeAndInvoke(self, selector: "reloadData")
    }
    
    func reloadData() {
        switch self.source.state {
        case .loading: self.renderLoading()
        case .error(let error): self.renderError(error)
        case .ready(let data): self.renderData(data)
        }
    }
    
    // MARK: Rendering
    
    func renderLoading() {
        self.titleLabel.text = "loading..."
    }
    
    func renderError(error: ErrorType) {
        self.titleLabel.text = String(error)
    }
    
    func renderData(data: PostDetailsModel) {
        self.titleLabel.text = data.title
        self.bodyTextView.text = data.body
        self.usernameLabel.text = data.username
        self.commentsCountLabel.text = String(data.commentsCount)
    }
    
}
