//
//  Source.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 16.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import UIKit

public enum SourceError: ErrorType {
    case Inconsistency
    case NoDataReturned
}

public enum State<T> {
    case loading
    case error(error: ErrorType)
    case ready(data: T)
}

public class Source<Output> {
    public var state: State<Output> {
        return self.getState()
    }
    
    func getState() -> State<Output> {
        return .error(error: RuntimeError.MissingImplementation)
    }
    
    func subscribe(to: Subscribable) {
        to.subscribe(self, selector: "notifyUpdate")
    }
    
    @objc func notifyUpdate() {
        NSNotificationCenter.subscribableCenter.postNotificationName(self.updateNotificationName(), object: nil)
    }
}

extension Source: Subscribable {
    public func updateNotificationName() -> String {
        return String(ObjectIdentifier(self).uintValue)
    }
}

