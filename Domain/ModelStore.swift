//
//  ModelStore.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

class ModelsStore<Model>: Source<Model> {
    let loadInteractor: Interactor<Any, Model>
    init(loadInteractor: Interactor<Any, Model>) {
        self.loadInteractor = loadInteractor
    }
}
