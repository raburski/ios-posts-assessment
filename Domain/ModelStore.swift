//
//  ModelStore.swift
//  Posts
//
//  Created by Marcin Raburski on 22.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public class ModelsStore<Model>: Source<Model> {
    internal let fetchInteractor: Interactor<Any, Model>
    internal let storage: Storage<Model>
    
    internal var fetchPerformed: Bool = false
    internal var error: ErrorType? = nil
    
    public init(fetchInteractor: Interactor<Any, Model>, storage: Storage<Model>) {
        self.fetchInteractor = fetchInteractor
        self.storage = storage
    }
    
    public override func getState() -> State<Model> {
        if let data = self.storage.get() {
            return .ready(data: data)
        }
        
        if let error = self.error {
            return .error(error: error)
        }
        
        if !self.fetchPerformed {
            if !self.fetchInteractor.isLoading {
                self.fetch()
            }
            return .loading
        }
        
        return .error(error: SourceError.NoDataReturned)
    }
    
    func fetch() {
        self.fetchInteractor.execute { [weak self] (data, error) -> () in
            if let error = error {
                self?.error = error
            }
            do {
                if let data = data {
                    try self?.storage.insert(data)
                }
            } catch {
                self?.error = error
            }
            self?.fetchPerformed = true
            self?.notifyUpdate()
        }
    }
}
