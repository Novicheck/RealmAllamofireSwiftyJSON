//
//  NetworkService.swift
//  RealmAllamofireSwiftyJSON
//
//  Created by Denis on 23.03.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import Alamofire
import SwiftyJSON

class NetworkService {
    let hostUrl = "https://jsonplaceholder.typicode.com/comments"
    
    static let shared = NetworkService()
    
    func getComment (completion: (([Comment])->Void)?) {
        _ = AF.request(hostUrl, method: .get)
            .responseJSON (completionHandler: { response in
                guard let value = response.value else {return}
                let json = JSON.init(value)
                let commentsJSON = json.arrayValue
                let commets = commentsJSON.map {try! JSONDecoder().decode(Comment.self, from: try! $0.rawData())}
                completion?(commets)
        })
    }
}
