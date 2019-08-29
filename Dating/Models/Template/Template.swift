//
//  Template.swift
//  loc
//
//  Created by oleygen ua on 1/24/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

class Template : Object, Decodable {
    
    let templateId = RealmOptional<Int>()
    let parentId = RealmOptional<Int>()
    @objc dynamic var templateTitle: String? = nil
    @objc dynamic var baseText: String? = nil
    @objc dynamic var isActive = false
    @objc dynamic var creationDate: Date? = nil
    
    let validityConditionList = List<ValidityCondition>()

    
    convenience init(templateId: Int?,
                     parentId: Int?,
         templateTitle: String?,
         baseText: String?,
         isActive: Bool,
         creationDate: Date?, validityConditions: [ValidityCondition]?) {
        
        self.init()
        self.templateId.value = templateId
        self.parentId.value = parentId
        self.templateTitle = templateTitle
        self.baseText = baseText
        self.isActive = isActive
        self.creationDate = creationDate
        if let validConds = validityConditions {
            self.validityConditionList.append(objectsIn: validConds)
        }
    }
    
    required init() {
        super.init()
    }
    
    enum CodingKeys: String, CodingKey {
        case isActive = "active"
        case templateId = "templateId"
        case parentId = "parentId"
        case creationDate = "creationTime"
        case text = "text"
        case title = "title"
        case validityConditions = "validityConditions"
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let templateId = try container.decodeIfPresent(Int.self, forKey: .templateId)
        let parentId = try container.decodeIfPresent(Int.self, forKey: .parentId)
  
        
        let templateTitle = try container.decodeIfPresent(String.self, forKey: .title)
        let baseText = try container.decodeIfPresent(String.self, forKey: .text)
      

        let isActive = try container.decode(Int.self, forKey: .isActive)
        let isActiveBool = (isActive == -1) ? false : true
        
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        
        let validityConditions = try container.decodeIfPresent([ValidityCondition].self, forKey: .validityConditions)
        

        self.init(templateId: templateId, parentId: parentId, templateTitle: templateTitle, baseText: baseText, isActive: isActiveBool, creationDate: creationDate, validityConditions: validityConditions)
      
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
        
    }
    
    required init(value: Any, schema: RLMSchema) {
         super.init(value: value, schema: schema)
    }
    
    func createUncreatedShake(creatorId: Int) -> Shake {
        return Shake(template: self, creatorId: creatorId)
    }
}
