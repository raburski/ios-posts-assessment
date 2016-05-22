//
//  TableViewHeaderExtension.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import UIKit

extension UITableView {
    func setAndLayoutTableHeaderView(header: UIView?) {
        self.tableHeaderView = nil
        if let header = header {
            header.setNeedsLayout()
            header.layoutIfNeeded()
            let height = header.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            var frame = header.frame
            frame.size.height = height
            header.frame = frame
            self.tableHeaderView = header
        }
    }
}
