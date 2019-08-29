//
//  ValidityCondition.swift
//  loc
//
//  Created by Oleynik Gennady on 21/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class ValidityCondition: Object, Decodable {
    let order = RealmOptional<Int>()
    let templateId = RealmOptional<Int>()
    let validityTypeId = RealmOptional<Int>()
    @objc dynamic var typeDisplayName: String?
    @objc dynamic var typeDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case order = "order"
        case templateId = "templateId"
        case validityTypeId = "validityTypeId"
        case typeDisplayName = "typeDisplayName"
        case typeDescription = "typeDescription"
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let order = try container.decodeIfPresent(Int.self, forKey: .order)
        let templateId = try container.decodeIfPresent(Int.self, forKey: .templateId)
        let validityTypeId = try container.decodeIfPresent(Int.self, forKey: .validityTypeId)
        let typeDisplayName = try container.decodeIfPresent(String.self, forKey: .typeDisplayName)
        let typeDescription = try container.decodeIfPresent(String.self, forKey: .typeDescription)
        
        self.init(order: order, templateId: templateId, validityTypeId: validityTypeId, typeDisplayName: typeDisplayName, typeDescription: typeDescription)
       
    }
    
    convenience init(order: Int?, templateId: Int?, validityTypeId: Int?, typeDisplayName: String?, typeDescription: String?) {
        self.init()
        self.order.value = order
        self.templateId.value = templateId
        self.validityTypeId.value = validityTypeId
        self.typeDisplayName = typeDisplayName
        self.typeDescription = typeDescription
    }
    
}
