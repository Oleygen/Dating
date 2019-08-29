//
//  DeclinedInfoService.swift
//  loc
//
//  Created by Oleynik Gennady on 17/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class DeclinedInfoService {
    static func saveIfNeeded(infos: Array<DeclinedInfo>) throws {
        try infos.forEach({ (declinedInfo) in
            try self.saveIfNeeded(info: declinedInfo)
        })
    }
    
    static func saveIfNeeded(info: DeclinedInfo) throws {
        let realm = try Realm()
        
        guard let decliningUserId = info.decliningUserId else {
            throw ApplicationError.noDecliningUserId
        }
        
        guard let shakeId = info.shakeId.value else {
            throw ApplicationError.noShakeId
        }
        
        
        guard realm.objects(DeclinedInfo.self).filter("decliningUserId == %@ AND shakeId == %@", decliningUserId, shakeId).first != nil else {
            try save(info: info)
            return
        }
    }
    
    
    static func save(info: DeclinedInfo) throws {
        guard (info.decliningUserId != nil) else {
            throw ApplicationError.noDecliningUserId
        }
        
        guard (info.shakeId.value != nil) else {
            throw ApplicationError.noShakeId
        }
        
        let realm = try Realm()
        
        try realm.write {
            realm.add(info)
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
}
