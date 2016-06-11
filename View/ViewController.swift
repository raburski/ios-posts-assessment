//
//  ViewController.swift
//  Posts
//
//  Created by Marcin Raburski on 03.06.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

public class TableViewController<Input>: UITableViewController {
    let input: Input!
    public init(input: Input, nibName: String? = nil, bundle: NSBundle? = nil) {
        self.input = input
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required public init?(coder decoder: NSCoder) {
        self.input = nil
        super.init(coder: decoder)
    }
}
