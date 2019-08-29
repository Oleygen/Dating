//
//  String+Validation.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation


fileprivate let emailFirstPart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
fileprivate let emailServerPart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
fileprivate let emailRegex = emailFirstPart + "@" + emailServerPart + "[A-Za-z]{2,8}"
fileprivate let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

fileprivate let phoneRegex = "^[0-9]{10,16}$"
fileprivate let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)

extension String {
    func isValidEmail() -> Bool {
        return emailPredicate.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return true
    }
    
    func isValidPhone() -> Bool {
        return phonePredicate.evaluate(with:self)
    }
    
    func isValidName() -> Bool {
        return self.count >= 1
    }
}
