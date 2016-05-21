//
//  NetworkingService.swift
//  CleanWeather
//
//  Created by Marcin Rabursky on 18/10/2015.
//  Copyright © 2015 Marcin Rabursky. All rights reserved.
//

import SwiftyJSON
import Just
import SwiftyDispatch

class NetworkingService: NetworkRequestDispatcher {
    static let sharedService = NetworkingService()

    func executeRequest(request: NetworkRequest, callback: CallbackBlock) {
        let method = request.request.HTTPMethod!.uppercaseString
        let urlString = request.request.URL?.absoluteString
        let requestBody = request.request.HTTPBody
        let params = [String: AnyObject]()
        let data = [String: AnyObject]()
        let headers = [String: String]()
        let files = [String: HTTPFile]()
        let cookies = [String: String]()
        Just.request(HTTPMethod(rawValue: method)!, URLString: urlString!, params: params, data: data, json: nil, headers: headers, files: files, auth: nil, cookies: cookies, allowRedirects: true, timeout: nil, URLQuery: nil, requestBody: requestBody, asyncProgressHandler: nil) { (response: HTTPResult!) -> Void in
            Queue.main().async({ () -> Void in
                callback(request: request, json: JSON(response.json ?? []), error: response.error)
            })
        }
    }
}
