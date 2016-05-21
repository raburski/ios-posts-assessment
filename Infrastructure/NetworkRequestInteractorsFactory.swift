//
//  NetworkRequestInteractorsFactory.swift
//  DeclarativeWeather
//
//  Created by Marcin Raburski on 17.05.2016.
//  Copyright © 2016 Marcin Rabursky. All rights reserved.
//

class NetworkRequestInteractorsFactory {
    static let sharedFactory = NetworkRequestInteractorsFactory()
    
    let networkRequestDispatcher = NetworkingService.sharedService

}
