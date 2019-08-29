//
//  ShakeSignature.swift
//  loc
//
//  Created by oleygen ua on 2/21/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ShakeSignature: Object, Decodable {
    
    @objc dynamic var creationDate: Date? = nil
    let shakeId = RealmOptional<Int>()
    @objc dynamic var sig: String? = nil
    let sigId = RealmOptional<Int>()
    @objc dynamic var signerFirstName: String? = nil
    let signerId = RealmOptional<Int>()
    @objc dynamic var signerLastName: String? = nil
    
    
    enum CodingKeys: String, CodingKey {
        case creationDate = "creationTime"
        case shakeId
        case sig
        case sigId
        case signerFirstName
        case signerId
        case signerLastName
        
    }
    
    convenience init(signatureId: Int, shakeId: Int, signerId: Int, creationDate: Date) {
        self.init()
        self.sigId.value = signatureId
        self.shakeId.value = shakeId
        self.signerId.value = signerId
        self.creationDate = creationDate
    }
    
    convenience required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let shakeId = try container.decodeIfPresent(Int.self, forKey: .shakeId)
        let sig = try container.decodeIfPresent(String.self, forKey: .sig)
        let sigId = try container.decodeIfPresent(Int.self, forKey: .sigId)
        let signerFirstName = try container.decodeIfPresent(String.self, forKey: .signerFirstName)
        let signerId = try container.decodeIfPresent(Int.self, forKey: .signerId)
        let signerLastName = try container.decodeIfPresent(String.self, forKey: .signerLastName)
        
        let creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)

        
        self.init()
        self.shakeId.value = shakeId
        self.sig = sig
        self.sigId.value = sigId
        self.signerFirstName = signerFirstName
        self.signerId.value = signerId
        self.signerLastName = signerLastName
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
