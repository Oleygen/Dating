//
//  RegistrationModuleFactory.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

protocol AuthModuleFactory {
    static func createAuthTypeScreen() -> AuthTypeInputHandler
    static func createGenderScreen() -> GenderInputHandler
    static func createBirthdayScreen() -> BirthdayInputHandler
    static func createNameScreen() -> NameInputHandler
    static func createEmailScreen() -> EmailInputHandler
    static func createPasswordScreen() -> PasswordInputHandler
    static func createPickPhotoScreen() -> PickPhotoInputHandler
    static func createLoginScreen() -> LoginInputHandler
}
