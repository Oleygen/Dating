//
//  ShakeHistoryVersion.swift
//  loc
//
//  Created by oleygen ua on 2/1/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class ShakeHistoryVersion: Object, Decodable {
    let id = RealmOptional<Int>()
    let editorId = RealmOptional<Int>()
    let shakeId = RealmOptional<Int>()
    @objc dynamic var creationDate: Date? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var text: String? = nil
    
    
    enum CodingKeys: String, CodingKey {
        case creationDate = "creationTime"
        case title = "editTitle"
        case text = "editText"
        case editorId = "editorId"
        case id = "id"
        case shakeId = "shakeId"
    }
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decodeIfPresent(Int.self, forKey: .id)
        let title = try container.decodeIfPresent(String.self, forKey: .title)
        let text = try container.decodeIfPresent(String.self, forKey: .text)
        let editorId = try container.decodeIfPresent(Int.self, forKey: .editorId)
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        let shakeId = try container.decodeIfPresent(Int.self, forKey: .shakeId)
        
        self.init(id: id, editorId: editorId, shakeId: shakeId, title: title, text: text, creationDate: creationDate)
    }
    
    
    convenience init(id: Int?,
                     editorId: Int?,
                     shakeId: Int?,
                     title: String?,
                     text: String?,
                     creationDate: Date?) {
        self.init()
        
        self.id.value = id
        self.editorId.value = editorId
        self.shakeId.value = shakeId
        self.title = title
        self.text = text
        self.creationDate = creationDate
    }
    
    required init() {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        
    }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
}


