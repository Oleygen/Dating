//
//  ShakeSignatureService.swift
//  loc
//
//  Created by Oleynik Gennady on 01/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class ShakeSignatureService {
    static func saveOrUpdate(signatures: Array<ShakeSignature>) throws {
        try signatures.forEach { signature in
            try saveOrUpdate(signature: signature)
        }
    }
    
    static func saveOrUpdate(signature: ShakeSignature) throws {
        let realm = try Realm()
        
        guard let signatureId = signature.sigId.value else {
            throw ApplicationError.noSignatureId
        }
        
        if let localSignature = realm.objects(ShakeSignature.self).filter("sigId == %@", signatureId).first {
            try update(local: localSignature, incoming: signature)
        } else {
            try save(signature: signature)
        }
    }
    
    static func save(signature: ShakeSignature) throws {
        guard signature.sigId.value != nil else {
            throw ApplicationError.noSignatureId
        }
        
        guard signature.shakeId.value != nil else {
            throw ApplicationError.noShakeId
        }
        
        guard signature.signerId.value != nil else {
            throw ApplicationError.noSignerId
        }
        
        let realm = try Realm()
        
        try! realm.write {
            realm.add(signature)
        }
    }
    
    static func update(local: ShakeSignature, incoming: ShakeSignature) throws {
        
        guard let localSigId = local.sigId.value, let incomingSigId = incoming.sigId.value, localSigId == incomingSigId else {
            throw ApplicationError.incorretSignatureUpdate
        }
        
        let realm = try! Realm()
        try! realm.write {
            local.shakeId.value = incoming.shakeId.value
            local.sig = incoming.sig
            local.signerFirstName = incoming.signerFirstName
            local.signerId.value = incoming.signerId.value
            local.signerLastName = incoming.signerLastName
            local.creationDate = incoming.creationDate
        }
    }
    
}
