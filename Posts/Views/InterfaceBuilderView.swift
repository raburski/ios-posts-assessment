//
//  InterfaceBuilderView.swift
//  Transactions
//
//  Created by Marcin Raburski on 20.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

class InterfaceBuilderView: UIView {
    init() {
        super.init(frame: CGRectZero)
        self.loadInterfaceBuilderView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadInterfaceBuilderView()
    }
    
    func loadInterfaceBuilderView() {
        let options = [NSObject: AnyObject]()
        if let view = NSBundle.mainBundle().loadNibNamed(String(self.dynamicType), owner: self, options: options).first as? UIView {
            self.addSubview(view)
            view.widthAnchor.constraintEqualToAnchor(self.widthAnchor)
            view.heightAnchor.constraintEqualToAnchor(self.heightAnchor)
        }
    }
    
}
