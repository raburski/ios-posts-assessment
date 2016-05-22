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
        self.translatesAutoresizingMaskIntoConstraints = false
        self.loadInterfaceBuilderView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
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
            let widthConstraint = NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1, constant: 0)
            let heightConstraint = NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 1, constant: 0)
            self.addConstraint(widthConstraint)
            self.addConstraint(heightConstraint)
        }
    }
    
}
