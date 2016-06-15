//
//  ArrayModelBuilder.swift
//  Posts
//
//  Created by Marcin Raburski on 21.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

import Foundation
import SwiftyJSON
import Domain

class ArrayModelBuilder<Output>: ModelBuilder<[Output]> {
    let modelBuilder: ModelBuilder<Output>
    init(modelBuilder: ModelBuilder<Output>) {
        self.modelBuilder = modelBuilder
        super.init()
    }
    
    override func build() throws -> [Output] {
        guard let array = self.input?.array else {
            throw BuilderError.CouldNotParse
        }
        
        return try array.map({ (json) -> Output in
            self.modelBuilder.input = json
            return try self.modelBuilder.build()
        })
    }
}
