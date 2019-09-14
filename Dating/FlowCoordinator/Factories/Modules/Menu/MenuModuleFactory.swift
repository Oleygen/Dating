//
//  MenuModuleFactory.swift
//  Dating
//
//  Created by Gennady  Oleynik  on 8/29/19.
//  Copyright © 2019 Gennady  Oleynik . All rights reserved.
//

import Foundation

protocol MenuModuleFactory {
    static func createMenuScreen()  -> MenuInputHandler
    static func createEditProfileScreen() -> EditProfileInputHandler
}
