//
//  DeclinedInfo.swift
//  loc
//
//  Created by Oleynik Gennady on 17/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class DeclinedInfo: Object, Decodable {
    let shakeId = RealmOptional<Int>()
    @objc dynamic var decliningUserId: String? = nil
    @objc dynamic var creationDate: Date? = nil
    
    
    enum CodingKeys: String, CodingKey {
        case decliningUserId = "decliningUserId"
        case shakeId = "shakeId"
        case creationDate = "creationTime"
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let shakeId = try container.decodeIfPresent(Int.self, forKey: .shakeId)
        let decliningUserId = try container.decodeIfPresent(String.self, forKey: .decliningUserId)
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)

        self.init(shakeId: shakeId, decliningUserId: decliningUserId, creationDate: creationDate)
    }
    
    
    convenience init(shakeId: Int?,
                     decliningUserId: String?,
                     creationDate: Date?) {
        self.init()
        self.shakeId.value = shakeId
        self.decliningUserId = decliningUserId
        self.creationDate = creationDate
    }
        
}
