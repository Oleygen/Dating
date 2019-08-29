//
//  BackgroundService.swift
//  loc
//
//  Created by Oleynik Gennady on 02/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class BackgroundService {
    static let instance = BackgroundService()
    
    func start() {
        NotificationCenter.default.addObserver(self, selector: #selector(userDidLogin), name: Constants.userDidLoginNotification, object: nil)
    }
    
    @objc func userDidLogin() {
        handleDefferedShakes()
    }
    
    private func handleDefferedShakes() {
        let realm = try! Realm()
        let defferedShakes = realm.objects(Shake.self).filter("shakeId == %@", Constants.defferedShakeId)
        let queries = defferedShakes.map({ ShakeQuery(shakeUniqueId: $0.realmId) })
        try! realm.write {
            realm.add(queries)
            defferedShakes.forEach({
                $0.shakeId.value = Constants.processingShakeId
                $0.creatorId.value = SessionService.currentUserId
            })
        }
        
        // TODO: - perform background request
        
        
    }
}
