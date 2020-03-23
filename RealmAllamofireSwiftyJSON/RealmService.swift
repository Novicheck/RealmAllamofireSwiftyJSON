//
//  RealmService.swift
//  RealmAllamofireSwiftyJSON
//
//  Created by Denis on 23.03.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class RealmService {
    
    static let shared = RealmService()
    
    func save (_ object: Object) {
        try? realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func saveObjects (_ object: [Object]) {
        try? realm.write {
            realm.add(object, update: .modified)
        }
    }
    
    func retrieveObject <T: Object> (by type: T.Type) -> [T]? {
        Array(realm.objects(type))
    }
}
