//
//  Subscribable.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import UIKit

extension NSNotificationCenter {
    @nonobjc static let subscribableCenter = NSNotificationCenter()

}

public protocol Subscribable {
    func updateNotificationName() -> String
}

extension Subscribable {
    public func notifyUpdate() {
        NSNotificationCenter.subscribableCenter.postNotificationName(self.updateNotificationName(), object: nil)
    }
    public func subscribe(target: AnyObject, selector: Selector) {
        NSNotificationCenter.subscribableCenter.addObserver(target, selector: selector, name: self.updateNotificationName(), object: nil)
    }
}
