//
//  UserWithPostSource.swift
//  Posts
//
//  Created by Marcin Raburski on 23.05.2016.
//  Copyright © 2016 Rzeczy. All rights reserved.
//

public class UserWithPostSource: StateSource<UserModel> {
    let postSource: Source<PostModel?>
    let usersSource: Source<State<[UserModel]>>
    public init(postSource: Source<PostModel?>, usersSource: Source<State<[UserModel]>>) {
        self.postSource = postSource
        self.usersSource = usersSource
        super.init()
        self.subscribeSelf(self.usersSource)
        self.subscribeSelf(self.postSource)
    }
    
    override public func getState() -> State<UserModel> {
        guard let post = self.postSource.state else {
            return .loading
        }
        
        switch self.usersSource.state {
        case .loading: return .loading
        case .error(let error): return .error(error: error)
        case .ready(let users):
            if let user = self.usersFilteredWithPost(users, post: post) {
                return .ready(data: user)
            } else {
                return .error(error: SourceError.NoDataReturned)
            }
        }
    }
    
    func usersFilteredWithPost(users: [UserModel], post: PostModel) -> UserModel? {
        return users.filter({ (element: UserModel) -> Bool in
            return element.id == post.userId
        }).first
    }
}
