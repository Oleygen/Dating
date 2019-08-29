//
//  Comment.swift
//  loc
//
//  Created by Oleynik Gennady on 01/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


class Comment: Object, Decodable {
    let id = RealmOptional<Int>()
    let shakeId = RealmOptional<Int>()
    let commenterId = RealmOptional<Int>()
    @objc dynamic var commentText: String? = nil
    @objc dynamic var isActive: Bool = true
    @objc dynamic var creationDate: Date? = nil
    
    convenience init(id: Int?,
                     shakeId: Int?,
                     commenterId: Int?,
                     commentText: String?,
                     isActive: Bool,
                     creationDate: Date?) {
        
        self.init()
        self.id.value = id
        self.shakeId.value = shakeId
        self.commenterId.value = commenterId
        self.commentText = commentText
        self.isActive = isActive
        self.creationDate = creationDate
    }
    
    required init() {
        super.init()
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case shakeId = "shakeId"
        case commenterId = "commenterId"
        case commentText = "commentText"
        case isActive = "active"
        case creationDate = "creationTime"
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let shakeId = try container.decodeIfPresent(Int.self, forKey: .shakeId)
        let commenterId = try container.decodeIfPresent(Int.self, forKey: .commenterId)
        
        let commentText = try container.decodeIfPresent(String.self, forKey: .commentText)
        
        let isActive = try container.decodeIfPresent(Int.self, forKey: .isActive)
        var isActiveBool = true
        if let isActive = isActive {
            isActiveBool = (isActive == -1) ? false : true
        }
 
        
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)

        
        self.init(id: id, shakeId: shakeId, commenterId: commenterId, commentText: commentText, isActive: isActiveBool, creationDate: creationDate)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}
