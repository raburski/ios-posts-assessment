//
//  ErrorView.swift
//  Transactions
//
//  Created by Marcin Raburski on 20.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

class ErrorView: InterfaceBuilderView {
    @IBOutlet var label: UILabel!
}

extension ErrorView {
    func setError(error: ErrorType) {
        self.label.text = String(error)
    }
}