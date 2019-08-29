//
//  RegisterRequestModel.swift
//  loc
//
//  Created by Oleynik Gennady on 14/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class RegisterRequestModel {
    let firstName: String
    let lastName: String
    let email: String
    let phone: String
    let password: String
    let publicKey: String
    
    init(firstName: String, lastName: String, email: String, phone: String?, password: String, publicKey: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phone = phone ?? "null"
        self.password = password
        self.publicKey = publicKey
    }
}
