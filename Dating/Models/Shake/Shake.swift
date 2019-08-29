//
//  PublishedShake.swift
//  loc
//
//  Created by Oleynik Gennady on 31/01/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Shake : Object, Decodable {
    @objc dynamic var realmId = UUID().uuidString
    
    let shakeId = RealmOptional<Int>()
    let templateId = RealmOptional<Int>()
    let creatorId = RealmOptional<Int>()
    
    let declinedInfoList = List<DeclinedInfo>()
    
    @objc dynamic var comment: Comment?
    @objc dynamic var ownerSignature: ShakeSignature?
    
    @objc dynamic var archiverId: String? = nil
    @objc dynamic var title: String? = nil
    @objc dynamic var shakeText: String? = nil
    @objc dynamic var creationDate: Date? = nil
    @objc dynamic var edits: String = ""
    @objc dynamic var isRevoked = false
    @objc dynamic var condition: ValidityCondition?
    
    
    var fetchRelatedTemplate: Template {
        let realm = try! Realm()
        let template = realm.objects(Template.self).filter("templateId == %@", self.templateId.value!).first!
        return template
    }
    
    var isDeclines: Bool {
        if (declinedInfoList.count == 0) {
            return false
        } else {
            return true
        }
    }
    
    var isCreated: Bool { // is created on server, false is local only
        if self.shakeId.value != nil {
            return true
        }
        return false
    }
    
    var isArchived: Bool {
        if (archiverId == nil) {
            return false
        } else {
            return true
        }
    }
    
    var isCompleted: Bool {
        return false
    }
    
    var hasComment: Bool {
        return self.comment?.commenterId.value != nil
    }
    
    var isSignedByOwner: Bool {
        return self.ownerSignature?.sigId.value != nil
    }
    
    override static func primaryKey() -> String? {
        return "realmId"
    }
    
    override static func ignoredProperties() -> [String] {
        return ["isCreated", "isDeclined", "isArchived", "isCompleted", "isSignedByOwner" , "fetchRelatedTemplate"]
    }
    
    convenience init(shakeId: Int?, creatorId: Int?, edits: String?, templateId: Int?, declines: [DeclinedInfo]? = nil, comment: Comment? = nil, ownerSignature: ShakeSignature? = nil, archiverId: String? = nil, text: String?, title: String?, creationDate: Date?, isRevoked: Bool = false) throws  {
        
        self.init()
        self.shakeId.value = shakeId
        self.creatorId.value = creatorId
        self.templateId.value = templateId
        if let declines = declines {
            self.declinedInfoList.append(objectsIn: declines)
        }
        self.ownerSignature = ownerSignature
        self.comment = comment
        self.archiverId = archiverId
        self.shakeText = text
        self.title = title
        self.creationDate = creationDate
        self.isRevoked = isRevoked
    }
    
    convenience init(template: Template, creatorId: Int) {
        
        self.init()
        self.templateId.value = template.templateId.value
        self.shakeText = template.baseText
        self.title = template.templateTitle
        self.creatorId.value = creatorId
    }
    
    func duplicate() throws -> Shake {
        guard let creatorId = self.creatorId.value else {
            throw ApplicationError.noCreatorId
        }
        
        guard let templateId = self.templateId.value else {
            throw ApplicationError.noTemplateId
        }
        
        guard let title = self.title else {
            throw ApplicationError.noTitle
        }
        
        let shake = try Shake(shakeId: nil, creatorId: creatorId, edits: self.edits, templateId: templateId, text: self.shakeText, title: "(Copy) \(title)", creationDate: Date())
        try ShakeService.save(shake: shake)
        return shake
    }
    
    enum CodingKeys: String, CodingKey {
        case shakeId = "id"
        case templateId = "templateId"
        case edits = "edits"
        case shakeText = "text"
        case archiverId = "archived"
        case title = "title"
        case creatorId = "creatorId"
        case creationDate = "creationTime"
        case declines = "declines"
        case comments = "comments"
        case ownerSignature = "signature"
        case isRevoked = "revoked"
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let shakeId = try container.decode(Int.self, forKey: .shakeId)
        let title = try container.decode(String.self, forKey: .title)
        let edits = try container.decodeIfPresent(String.self, forKey: .edits)
        let shakeText = try container.decode(String.self, forKey: .shakeText)
        let creatorId = try container.decode(Int.self, forKey: .creatorId)
        let archiverId = try container.decodeIfPresent(String.self, forKey: .archiverId)
        
        let declines = try container.decodeIfPresent([DeclinedInfo].self, forKey: .declines)
        
        let comment = try container.decodeIfPresent(Comment.self, forKey: .comments)
        
        let ownerSignature = try container.decodeIfPresent(ShakeSignature.self, forKey: .ownerSignature)
        
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        
        let templateId = try container.decodeIfPresent(Int.self, forKey: .templateId)
        
        let isRevoked = try container.decode(Int.self, forKey: .isRevoked)
        let isRevokedBool = (isRevoked == 0) ? false : true
        
        try self.init(shakeId: shakeId, creatorId: creatorId, edits: edits, templateId: templateId, declines: declines, comment: comment, ownerSignature: ownerSignature, archiverId: archiverId, text: shakeText, title: title, creationDate: creationDate, isRevoked: isRevokedBool)
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
