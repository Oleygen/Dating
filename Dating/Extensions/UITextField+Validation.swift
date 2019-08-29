//
//  UITextField+Validation.swift
//  loc
//
//  Created by oleygen ua on 2/8/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    func isValidEmail() -> Bool {
        if let text = text {
            return text.isValidEmail()
        } else {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
        if let text = text {
            return text.isValidPassword()
        } else {
            return false
        }
    }
    
    func isValidPhone() -> Bool {
        if let text = text {
            return text.isValidPhone()
        } else {
            return false
        }
    }
    
    func isValidName() -> Bool {
        if let text = text {
            return text.isValidName()
        } else {
            return false
        }
    }
}
