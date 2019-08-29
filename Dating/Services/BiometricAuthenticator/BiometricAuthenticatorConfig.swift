//
//  BiometricAuthenticatorConfig.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class BiometricAuthenticatorConfig {
    let cancelTitle: String?
    let reason: String
    
    private init(cancelTitle: String?, reason:String) {
        self.cancelTitle = cancelTitle
        self.reason = reason
    }
    
    static var signShake: BiometricAuthenticatorConfig {
        return BiometricAuthenticatorConfig(cancelTitle: nil, reason: "Sign a shake")
    }
    
    
}
