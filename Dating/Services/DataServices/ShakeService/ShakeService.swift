//
//  ShakeService.swift
//  loc
//
//  Created by Oleynik Gennady on 19/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class ShakeService {
    static func saveOrUpdate(shakes: Array<Shake>) throws {
        try shakes.forEach { shake in
            try ShakeService.saveOrUpdate(shake: shake)
        }
    }
    
    static func saveOrUpdate(shake: Shake) throws {
        let realm = try Realm()
        
        guard let shakeId = shake.shakeId.value else {
            throw ApplicationError.saveUncreated
        }
        
        if let localShake = realm.objects(Shake.self).filter("shakeId == %@", shakeId).first {
            try ShakeService.update(local: localShake, incoming: shake)
        } else {
            try ShakeService.save(shake: shake)
        }
    }
    
    static func save(shake: Shake) throws {
        guard shake.templateId.value != nil else {
            throw ApplicationError.noTemplateId
        }
        
        let realm = try Realm()

        try realm.write {
            realm.add(shake)
        }
    }
    
    static func update(local: Shake, incoming: Shake) throws {
        let realm = try Realm()
        try realm.write {
            
            guard let templateId = incoming.templateId.value else {
                throw ApplicationError.noTemplateId
            }
        
            local.templateId.value = templateId
            local.title = incoming.title
            local.shakeText = incoming.shakeText
            local.creationDate = incoming.creationDate
            local.creatorId.value = incoming.creatorId.value
            local.edits = incoming.edits
            local.archiverId = incoming.archiverId
            
            #warning ("lost data in db here")
            local.comment = incoming.comment
            local.declinedInfoList.removeAll()
            local.declinedInfoList.append(objectsIn: incoming.declinedInfoList)
            local.ownerSignature = incoming.ownerSignature
            local.isRevoked = incoming.isRevoked
        }
    }
    
    
    static func update(shake: Shake, with id: Int, creationDate: Date, creatorId: Int) throws {
        let realm = try Realm()
        try! realm.write {
            shake.shakeId.value = id
            shake.creationDate = creationDate
            shake.creatorId.value = creatorId
        }
    }
    
    static func update(shake: Shake, with id: Int, creationDate: Date) throws {
        let realm = try Realm()
        try realm.write {
            shake.shakeId.value = id
            shake.creationDate = creationDate
        }
    }
    
    static func sign(_ shake: Shake, signatureId: Int) throws {
        guard let shakeId = shake.shakeId.value else {
            throw ApplicationError.noShakeId
        }
        
        guard let signerId = SessionService.currentUserId else {
            throw ApplicationError.noCurrentUser
        }

        let signature = ShakeSignature(signatureId: signatureId, shakeId: shakeId, signerId: signerId, creationDate: Date())
        
        let realm = try Realm()
        try realm.write {
            realm.add(signature)
            shake.ownerSignature = signature
        }
    }
}
