//
//  AuthModuleFactory.swift
//  loc
//
//  Created by oleygen ua on 1/22/19.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

protocol AuthModuleFactory {
    static func createLogin() -> LoginInputHandler
    static func createRegister() -> RegisterInputHandler
    static func createForgot() -> ForgotInputHandler
}
