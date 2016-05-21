//
//  ViewController.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit
import Infrastructure

class ViewController: UIViewController {
    let postsInteractor = NetworkRequestInteractorsFactory.sharedFactory.getPostsInteractor()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.postsInteractor.execute { (data, error) -> () in
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

