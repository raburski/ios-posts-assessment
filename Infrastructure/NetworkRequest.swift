//
//  NetworkRequest.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import Foundation

struct NetworkRequest {
    let uuid: String
    let request: NSURLRequest
}

extension NetworkRequest: Equatable {}
func ==(lhs: NetworkRequest, rhs: NetworkRequest) -> Bool {
    return lhs.uuid == rhs.uuid && lhs.request == rhs.request
}
