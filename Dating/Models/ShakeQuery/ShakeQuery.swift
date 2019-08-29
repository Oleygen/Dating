//
//  ShakeQuery.swift
//  loc
//
//  Created by Oleynik Gennady on 02/04/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import RealmSwift

class ShakeQuery: Object {
    @objc dynamic var shakeUniqueId: String?
    @objc dynamic var attemps = 0
    
    convenience init(shakeUniqueId: String) {
        self.init()
        self.shakeUniqueId = shakeUniqueId
    }
}
