//
//  ShakeHistoryVersionService.swift
//  loc
//
//  Created by Oleynik Gennady on 01/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class ShakeHistoryVersionService {
    
    static func saveOrUpdate(versions: Array<ShakeHistoryVersion>) throws {
        try versions.forEach { version in
            try saveOrUpdate(version: version)
        }
    }
    
    static func saveOrUpdate(version: ShakeHistoryVersion) throws {
        guard let id = version.id.value else {
            throw ApplicationError.noShakeHistoryId
        }
        
        guard version.editorId.value != nil else {
            throw ApplicationError.noShakeHistoryEditorId
        }
        
        guard version.shakeId.value != nil else {
            throw ApplicationError.noShakeHistoryShakeId
        }
        
        guard version.creationDate != nil else {
            throw ApplicationError.noShakeHistoryCreationDate
        }
        
        let realm = try Realm()
        if let local = realm.objects(ShakeHistoryVersion.self).filter("id == %@", id).first {
            try update(local: local, incoming: version)
        } else {
            try save(version)
        }
    }

    static func update(local: ShakeHistoryVersion, incoming: ShakeHistoryVersion) throws {
        guard let localId = local.id.value, let incomingId = incoming.id.value, localId == incomingId else {
            throw ApplicationError.incorrectShakeHistoryUpdate
        }
    
        let realm = try Realm()
        try realm.write {
            local.shakeId.value = incoming.shakeId.value
            local.editorId.value = incoming.editorId.value
            local.text = incoming.text
            local.title = incoming.title
            local.creationDate = incoming.creationDate
        }
    }
    
    
    static func save(_ shakeHistory: ShakeHistoryVersion) throws {
        guard shakeHistory.id.value != nil else {
            throw ApplicationError.noShakeHistoryId
        }
        
        guard shakeHistory.editorId.value != nil else {
            throw ApplicationError.noShakeHistoryEditorId
        }
        
        guard shakeHistory.creationDate != nil else {
            throw ApplicationError.noShakeHistoryCreationDate
        }
        
        let realm = try Realm()
        try realm.write {
            realm.add(shakeHistory)
        }
    }
}
