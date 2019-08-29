//
//  LoginRequestModel.swift
//  loc
//
//  Created by Oleynik Gennady on 14/03/2019.
//  Copyright © 2019 oleygen. All rights reserved.
//

import Foundation

class LoginRequestModel {
    let email: String
    let password: String
    let publicKey: String
    
    
    init (email: String, password: String, publicKey: String) {
        self.email = email
        self.password = password
        self.publicKey = publicKey
    }
}
