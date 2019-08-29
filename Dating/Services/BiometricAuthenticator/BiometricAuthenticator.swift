//
//  BiometricAuthenticator.swift
//  loc
//
//  Created by oleygen ua on 2/13/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import LocalAuthentication


class BiometricAuthenticator {
    
    static func showDialog(with config: BiometricAuthenticatorConfig, successHandler: @escaping () -> Void ) {
        
        let context = LAContext()
        context.localizedCancelTitle = config.cancelTitle
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: config.reason) { success, error in
                if success {
                    DispatchQueue.main.async {
                        successHandler()
                        return
                    }
                }
            }
        }
    }
}
