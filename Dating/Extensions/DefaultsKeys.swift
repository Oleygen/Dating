//
//  DefaultsKeys.swift
//  loc
//
//  Created by Oleynik Gennady on 28/01/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let pushToken = DefaultsKey<String>("pushToken")
    static let userId = DefaultsKey<Int?>("userId", defaultValue: nil)
    static let firstName = DefaultsKey<String?>("firstName")
    static let lastName = DefaultsKey<String?>("lastName")
    static let email = DefaultsKey<String?>("email")
    static let phone = DefaultsKey<String?>("phone")
    static let firstRun = DefaultsKey<Bool>("firstRun", defaultValue: true)
    static let needShowOnboarding = DefaultsKey<Bool>("needShowOnboarding", defaultValue: true)
    static let authorized = DefaultsKey<Bool>("authorized", defaultValue: false)
    static let isTokenRegistered = DefaultsKey<Bool>("isTokenRegistered", defaultValue: false)
    
}
