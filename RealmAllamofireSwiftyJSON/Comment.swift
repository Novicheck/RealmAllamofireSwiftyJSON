//
//  Comment.swift
//  RealmAllamofireSwiftyJSON
//
//  Created by Denis on 23.03.2020.
//  Copyright © 2020 Denis. All rights reserved.
//
import Foundation
import RealmSwift

class Comment: Object, Decodable {
    @objc dynamic var postId: Int = 0
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var body: String = ""
    
    @objc open override class func primaryKey() -> String? {
        return "id"
    }
}
