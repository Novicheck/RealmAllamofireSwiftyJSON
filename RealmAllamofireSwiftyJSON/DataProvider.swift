//
//  DataProvider.swift
//  RealmAllamofireSwiftyJSON
//
//  Created by Denis on 23.03.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation

class DataProvider {
    
    static let shared = DataProvider()
    
    func fetchComments (completion: (([Comment]) -> Void)?) {
        NetworkService.shared.getComment { comments in
            RealmService.shared.saveObjects(comments)
        }
        guard let comments = RealmService.shared.retrieveObject(by: Comment.self) else {return}
        completion?(comments)
    }
}
