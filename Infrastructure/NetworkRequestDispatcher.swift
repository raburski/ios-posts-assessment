//
//  NetworkRequestDispatcher.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON

typealias CallbackBlock = (request: NetworkRequest, json: JSON?, error: ErrorType?) -> ()

protocol NetworkRequestDispatcher {
    func executeRequest(request: NetworkRequest, callback: CallbackBlock)
}